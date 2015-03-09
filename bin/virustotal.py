#!/usr/bin/env python2.7

# Full VT APIv2 functions added by Andriy (aka doomedraven) Brukhovetskyy (Twitter : @d00m3dr4v3n)
# No Licence or warranty expressed or implied, use however you wish!
# For more information look at:
#
# https://www.virustotal.com/en/documentation/public-api
# https://www.virustotal.com/en/documentation/private-api

import os
import re
import sys
import time
import json
import glob
import time
import hashlib
import argparse
import requests
import ConfigParser
import texttable as tt
from operator import methodcaller
from dateutil.relativedelta import relativedelta

def private_api_access_error():
      print '\n[!] You don\'t have permission for this operation, Looks like you trying to access to PRIVATE API functions\n'
      sys.exit()

def parse_conf(file_name):

      try:
            confpath = os.path.expanduser(file_name)

            if os.path.exists(confpath):

                  config = ConfigParser.RawConfigParser()
                  config.read(confpath)
                  apikey = config.get('vt', 'apikey')

                  return apikey

            else:
                  sys.exit('\nFile {0} don\'t exists\n'.format(confpath))

      except Exception:
            sys.exit('No API key provided and cannot read ~/.vtapi. Specify an API key in vt.py or in ~/.vtapi or  in your file')

def pretty_print(block, headers, sizes = False, align = False):

  tab = tt.Texttable()

  if isinstance(block, list):
    plist = []

    for line in block:

      if len(headers) == 1:
        plist.append([line])

      else:
        plist.append(map(lambda key: line[key] if line.get(key) else ' -- ', headers))

    if len(plist) > 1 and isinstance(plist[0], list):
      tab.add_rows(plist)

    else:
      tab.add_row(plist[0])

  else:
    row   = map(lambda key: block[key] if block.get(key) else ' -- ', headers)
    tab.add_row(row)

  tab.header(headers)

  if not align:
      align = map(lambda key: 'l', headers)

  if sizes:
      tab.set_cols_width(sizes)

  tab.set_cols_align(align)

  print tab.draw()

def pretty_print_special(rows, headers, sizes = False, align = False):
      tab = tt.Texttable()
      tab.add_rows(rows)

      if sizes:
            tab.set_cols_width(sizes)

      if align:
            tab.set_cols_align(align)

      tab.header(headers)

      print '\n', tab.draw()

def is_file(value):
      try:
            if isinstance(value, list):

                  if os.path.isfile(value[0]):
                        return True, value[0]

                  else:
                        return False, value[0]

            elif isinstance(value, basestring):

                  if os.path.isfile(value):
                        return True, value

                  else:
                        return False, value

      except IndexError:
            print '\n[!] You need to provide some arguments\n'
            sys.exit()

def jsondump(jdata, md5):

      jsondumpfile = open('VTDL_{name}.json'.format(name = md5), 'w')
      json.dump(jdata, jsondumpfile)
      jsondumpfile.close()

      print '\n\tJSON Written to File -- VTDL_{md5}.json\n'.format(md5 = md5)

def load_file(file_path):

      try:
            log    = open(file_path, 'r').read()
            jdata  =  json.loads(log)
            return jdata

      except TypeError:
            print '\n[!] Check your json dump file\n'

def print_results(jdata, undetected_downloaded_samples, detected_communicated,\
                  undetected_communicated_samples, detected_urls):


    if jdata.get('undetected_downloaded_samples') and undetected_downloaded_samples:

        print '\n[+] Latest undetected files that were downloaded from this domain/ip\n'
        pretty_print(sorted(jdata['undetected_downloaded_samples'], key=methodcaller('get', 'date'), reverse=True), ['positives', 'total','date','sha256'], [15, 10, 20, 70], ['c', 'c', 'c', 'c'])


    if jdata.get('detected_communicating_samples') and detected_communicated:

        print '\n[+] Latest detected files that communicate with this domain/ip\n'
        pretty_print(sorted(jdata['detected_communicating_samples'] , key=methodcaller('get', 'scan_date'), reverse=True), ['positives', 'total','date','sha256'], [15, 10, 20, 70], ['c', 'c', 'c', 'c'])


    if jdata.get('undetected_communicating_samples') and undetected_communicated_samples:

        print '\n[+] Latest undetected files that communicate with this domain/ip\n'
        pretty_print(sorted(jdata['undetected_communicating_samples'], key=methodcaller('get', 'date'), reverse=True), ['positives', 'total','date','sha256'], [15, 10, 20, 70], ['c', 'c', 'c', 'c'])


    if jdata.get('detected_urls') and detected_urls:

        print '\n[+] Latest detected URLs\n'
        pretty_print(sorted(jdata['detected_urls'], key=methodcaller('get', 'scan_date'), reverse=True), ['positives', 'total','scan_date','url'], [15, 10, 20, 100], ['c', 'c', 'c', 'l'])

def get_detections(scans):


      plist   = [[]]
      engines = ['Sophos', 'Kaspersky', 'TrendMicro']
      cont    = 3

      for engine in engines:
          if scans.get(engine) and scans[engine].get('result'):
              plist.append([engine, scans[engine]['result']])
              cont -= 1

      for engine in scans:
            if scans.get(engine) and scans[engine].get('result') and cont > 0:
                  plist.append([engine, scans[engine]['result']])
                  cont -= 1

            elif cont == 0:
                  break
      if cont != 3:
            pretty_print_special(plist, ['Vendor name',  'Result'], [30, 55], ['r', 'l'])

def parse_report(jdata, hash_report, verbose, dump, url_report = False, not_exit = False):

  if jdata['response_code'] != 1:

    if not not_exit:
      return False

    else:
      print '\n[-] Status : {info}\n'.format(info=jdata['verbose_msg'])
      sys.exit()

  if jdata.get('scan_date') : print '\nScanned on : \n\t{0}'.format(jdata['scan_date'])
  if jdata.get('total') : print '\nDetections:\n\t {positives}/{total} Positives/Total'.format(positives = jdata['positives'], total = jdata['total'])

  if url_report:
      if jdata.get('url') : print 'Scanned url :\n\t {url}'.format(url = jdata['url'])

  else:
    if not verbose:
      get_detections(jdata['scans'])

    print '\n\tResults for MD5    : {0}'.format(jdata['md5'])
    print '\tResults for SHA1   : {0}'.format(jdata['sha1'])
    print '\tResults for SHA256 : {0}'.format(jdata['sha256'])

  if verbose == True and jdata.get('scans'):
    print '\nVerbose VirusTotal Information Output:'
    plist = [[]]

    for x in jdata['scans']:
        plist.append([x, 'True' if jdata['scans'][x]['detected'] else 'False', jdata['scans'][x]['result'] if jdata['scans'][x]['result'] else ' -- '])

    pretty_print_special(plist, ['Vendor name', 'Detected', 'Result'], [30, 9, 55], ['r', 'c', 'l'])

    del plist

  if dump == True:
    jsondump(jdata, hash_report)

  if jdata.get('permalink') : print "\n\tPermanent Link : {0}\n".format(jdata['permalink'])

  return True

## Static variable decorator for function
def static_var(varname, value):
    def decorate(func):

        setattr(func, varname, value)

        return func

    return decorate

## Track how many times we issue a request
@static_var("counter", 0)
## Track when the first request was sent
@static_var("start_time", 0)
def get_response(url, method="get", **kwargs):

      ## Set on first request
      if get_response.start_time == 0:
            get_response.start_time = time.time()

      ## Increment every request
      get_response.counter = 1

      jdata    = ''
      response = ''

      while True:
            try:
                  response = getattr(requests, method)(url, **kwargs)

            except requests.exceptions.ConnectionError:
                  print '\n[!] Can\'t resolv hostname, check your internet conection\n'
                  sys.exit()

            if response.status_code == 403:
                  private_api_access_error()

            if response.status_code != 204:

                  try:
                        jdata = response.json()

                  except:
                        jdata = response.json

                  break

            ## Determine minimum time we need to wait for limit to reset
            wait_time = 59 - int(time.time() - get_response.start_time)

            if wait_time < 0:
                  wait_time = 60

            print "Reached per minute limit of {0:d}; waiting {1:d} seconds\n".format(get_response.counter, wait_time)

            time.sleep(wait_time)

            ## Reset static vars
            get_response.counter    = 0
            get_response.start_time = 0

      return jdata, response

class vtAPI():

    def __init__(self, apikey):

        self.api   = apikey
        self.base  = 'https://www.virustotal.com/vtapi/v2/'

    def getReport(self, hash_report, allinfo = False, verbose = False, dump = False, not_exit = False):

      """
      A md5/sha1/sha256 hash will retrieve the most recent report on a given sample. You may also specify a scan_id (sha256-timestamp as returned by the file upload API)
      to access a specific report. You can also specify a CSV list made up of a combination of hashes and scan_ids (up to 4 items or 25 if you have private api with the
      standard request rate), this allows you to perform a batch request with one single call.
      """

      result, name = is_file(hash_report)

      if result:
          jdata = load_file(name)
          dump  = False

      else:
            if isinstance(hash_report, list) and len(hash_report) == 1:
                hash_report = hash_report[0]

            elif isinstance(hash_report, basestring):
                hash_report = hash_report

            elif len(hash_report) > 25 and not isinstance(hash_report, basestring):
                print '[-] To many urls for scanning, MAX 25'
                sys.exit()

            else:
                hash_report = ', '.join(map(lambda hash_part: hash_part, hash_report))
                print hash_report

            params  = {'resource':hash_report,'apikey':self.api}

            if allinfo:
              params.setdefault('allinfo', allinfo)

            url = self.base + 'file/report'

            jdata, response = get_response(url, params=params)

      if jdata['response_code'] == 0 or jdata['response_code'] == -1:

            if not_exit:
                return False

            else:
                  if jdata.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata['verbose_msg'])
                  sys.exit()

      if allinfo == '1':

          if dump:
              jsondump(jdata, name)

          if jdata.get('md5')    : print '\nMD5    : {md5}'.format(    md5 = jdata['md5'])
          if jdata.get('sha1')   : print 'SHA1   : {sha1}'.format(    sha1 = jdata['sha1'])
          if jdata.get('sha256') : print 'SHA256 : {sha256}'.format(sha256 = jdata['sha256'])
          if jdata.get('ssdeep') : print 'SSDEEP : {ssdeep}'.format(ssdeep = jdata['ssdeep'])

          if jdata.get('scan_date') : print '\nScan  Date     : {scan_date}'.format(  scan_date = jdata['scan_date'])
          if jdata.get('first_seen'): print 'First Submission : {first_seen}'.format(first_seen = jdata['first_seen'])
          if jdata.get('last_seen') : print 'Last  Submission : {last_seen}'.format(  last_seen = jdata['last_seen'])

          if jdata.get('submission_names'):
            print '\nSubmission names:'
            for name in jdata['submission_names']:
                  print '\t{name}'.format(name = name)

          if jdata.get('type') : print '\nFile Type   : {type_f}'.format(type_f = jdata['type'])
          if jdata.get('size') : print 'File Size   : {size}'.format(    size   = jdata['size'])
          if jdata.get('tags') : print 'Tags   : {tags}'.format(tags = ', '.join(map(lambda tag: tag, jdata['tags'])))

          if jdata.get('additional_info'):
            #[u'pe-resource-list', u'pe-resource-langs', u'pe-timestamp', u'imports', u'pe-entry-point', u'pe-resource-types', u'sections', u'pe-machine-type']
            if jdata['additional_info']['magic'] : print 'Magic  : {magic}'.format(magic = jdata['additional_info']['magic'])

            if jdata['additional_info'].get('referers'):
              print '\nReferers:'
              for referer in jdata['additional_info']['referers']:
                  print '\t{referer}'.format(referer = referer)

            if jdata['additional_info'].get('sigcheck'):

                  print '\nPE signature block:'
                  plist = [[]]

                  for sig in jdata['additional_info']['sigcheck']:
                      plist.append([sig, jdata['additional_info']['sigcheck'][sig]])

                  pretty_print_special(plist, ['Name','Value'])
                  del plist

            if jdata['additional_info'].get('exiftool'):

                  print '\nExifTool file metadata:'
                  plist = [[]]

                  for exiftool in jdata['additional_info']['exiftool']:
                        plist.append([exiftool, jdata['additional_info']['exiftool'][exiftool]])

                  pretty_print_special(plist, ['Name','Value'])
                  del plist

            if jdata['additional_info'].get('sections'):
                pretty_print_special(jdata['additional_info']['sections'], ['Name', 'Virtual address', 'Virtual size', 'Raw size', 'Entropy', 'MD5'], [10,10,10,10,10, 35], ['c', 'c', 'c', 'c', 'c', 'c'])

            if jdata['additional_info'].get('imports'):

                  print '\nImports:'

                  for imported in jdata['additional_info']['imports']:

                        print '\t{0}'.format(imported)

                        for valor in jdata['additional_info']['imports'][imported]:
                              print '\t\t{0}'.format(valor)

            if jdata['additional_info'].get('trid'):
                  print '\nTrID:'
                  print '\t{trid}'.format(trid = jdata['additional_info']['trid'].replace('\n', '\n\t'))

          if jdata.get('total') : print '\nDetections:\n\t{positives}/{total} Positives/Total\n'.format(positives = jdata['positives'], total = jdata['total'])

          if jdata.get('scans'):

            plist = [[]]
            for x in jdata['scans']:
               plist.append([x,  'True' if jdata['scans'][x]['detected'] else 'False', jdata['scans'][x]['result']])

            pretty_print_special(plist, ['Name', 'Detected', 'Result'], [30, 9, 55], ['l', 'c', 'l'])

            del plist

          if jdata.get('permalink') : print '\nPermanent link : {permalink}\n'.format(permalink = jdata['permalink'])
          return True

      else:
          result = parse_report(jdata, hash_report, verbose, dump, False, not_exit)
          return result

    def rescan(self, hash_rescan, date = False, period = False, repeat = False, notify_url = False, notify_changes_only = False, delete = False):

        """
        This API allows you to rescan files in VirusTotal's file store without having to resubmit them, thus saving bandwidth.
        """

        if len(hash_rescan) == 1:
            hash_rescan = hash_rescan

        elif isinstance(hash_re, basestring):
            hash_rescan = [hash_rescan]

        elif len(hash_rescan) > 25 and not isinstance(hash_rescan, basestring):
            print '[-] To many urls for scanning, MAX 25'
            sys.exit()

        else:
            hash_rescan = ', '.join(map(lambda hash_part: hash_part, hash_rescan))

        url = self.base + 'file/rescan'

        for hash_part in hash_rescan:

            params  = {'resource':hash_part,'apikey':self.api}

            if delete:
                  url = url + '/delete'
            else:
                  if date:
                   params.setdefault('date', date)

                  if period:
                    params.setdefault('period', period)

                    if repeat:
                      params.setdefault('repeat', repeat)

                  if notify_url:
                    params.setdefault('notify_url', notify_url)

                    if notify_changes_only:
                      params.setdefault('notify_changes_only',notify_changes_only)


            jdata, response = get_response(url, params=params, method='post')

            if jdata['response_code'] == 0 or jdata['response_code'] == -1:
              if jdata.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata['verbose_msg'])
              sys.exit()

            if isinstance(jdata, list):
                for jdata_part in jdata:
                  if jdata_part.get('sha256') : print '[+] Check rescan result with sha256 in few minuts : \n\tSHA256 : {sha256}'.format(sha256 = jdata_part['sha256'])
                  if jdata.get('permalink')   : print '\tPermanent link : {permalink}\n'.format(permalink = jdata['permalink'])
            else:
              if jdata.get('sha256')    : print '[+] Check rescan result with sha256 in few minuts : \n\tSHA256 : {sha256}'.format(sha256 = jdata_part['sha256'])
              if jdata.get('permalink') : print '\tPermanent link : {permalink}\n'.format(permalink = jdata['permalink'])

    def fileScan(self, files, verbose = False, notify_url = False, notify_changes_only = False, dump = False, scan = False):

        """
        Allows to send a file to be analysed by VirusTotal.
        Before performing your submissions we encourage you to retrieve the latest report on the files,
        if it is recent enough you might want to save time and bandwidth by making use of it. File size limit is 32MB,
        in order to submmit files up to 200MB you must request an special upload URL.

        Before send to scan, file will be checked if not scanned before, for save bandwich and VT resources :)
        """

        if len(files) == 1 and isinstance(files, list):
            files = glob.glob('{files}'.format(files=files[0]))

        elif isinstance(files, basestring):
            files = glob.glob('{files}'.format(files=files))

        params = {'apikey':self.api}

        if notify_url:
          params.setdefault('notify_url', notify_url)

          if notify_changes_only:
            params.setdefault('notify_changes_only',notify_changes_only)

        url = self.base+'file/scan'

        for submit_file in files:

            readed = open(submit_file, 'rb').read()
            md5    = hashlib.md5(readed).hexdigest()

            not_exit = True

            result = self.getReport(md5, False, verbose, dump, not_exit)

            if not result and scan == True:

                  if (os.path.getsize(submit_file) / 1048576) <= 32:

                    if os.path.isfile(submit_file):

                      print 'Submiting file: {filename}'.format(filename = submit_file)

                      file_name = os.path.split(submit_file)[-1]
                      files  = {"file": (file_name, open(submit_file, 'rb'))}

                      try:

                          jdata, response = get_response(url, files=files, params=params, method="post")

                          if jdata['response_code'] == 0 or jdata['response_code'] == -1:
                            if jdata.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata['verbose_msg'])
                            sys.exit()

                          if jdata.get('md5')    : print '\n\tResults for MD5    : {md5}'.format(md5 = jdata['md5'])
                          if jdata.get('sha1')   : print '\tResults for SHA1   : {sha1}'.format(sha1 = jdata['sha1'])
                          if jdata.get('sha256') : print '\tResults for SHA256 : {sha256}'.format(sha256 = jdata['sha256'])

                          if jdata.get('verbose_msg') :  print '\n\tStatus         : {verb_msg}'.format(verb_msg = jdata['verbose_msg'])
                          if jdata.get('permalink')   :  print '\tPermanent link : {permalink}\n'.format(permalink = jdata['permalink'])

                      except UnicodeDecodeError:
                        print '\n[!] Sorry filaname is not utf-8 format, other format not suported at the moment'
                        print '[!] Ignored file: {file}\n'.format(file = submit_file)

                  else:
                    print '[!] Ignored file: {file}'.format(file = submit_file)


            elif not result and scan == False:
                  print 'Report for file : {0} not fount'.format(submit_file)

    def url_scan_and_report(self, urls, key, verbose, dump=False, add_to_scan='0'):

        """
        Url scan:
        URLs can also be submitted for scanning. Once again, before performing your submission we encourage you to retrieve the latest report on the URL,
        if it is recent enough you might want to save time and bandwidth by making use of it.

        Url report:
        A URL will retrieve the most recent report on the given URL. You may also specify a scan_id (sha256-timestamp as returned by the URL submission API)
        to access a specific report. At the same time, you can specify a space separated list made up of a combination of hashes and scan_ids so as to perform a batch
        request with one single call (up to 4 resources or 25 if you have private api, per call with the standard request rate).
        """

        result, name = is_file(urls)

        md5 = ''

        if result:
            jdata = load_file(name)
            dump  = False

        else:

            if isinstance(urls, list) and len(urls) == 1:
                url_upload = urls[0]

            elif isinstance(urls, basestring):
                url_upload = urls

            elif len(urls) > 4 and not isinstance(urls, basestring):
                print '[-] To many urls for scanning, MAX 4'
                sys.exit()

            else:
                if key == 'scan':
                  url_upload = '\n'.join(map(lambda url: url, urls))

                elif key == 'report':
                  url_upload = ', '.join(map(lambda url: url, urls))

            if key == 'scan':
              print 'Submitting url(s) for analysis: \n\t{url}'.format(url = url_upload.replace('\n','\n\t'))
              params = {'url':url_upload,'apikey':self.api}
              url   = self.base + 'url/scan'

            elif key == 'report':
              print '\nSearching for url(s) report: \n\t{url}'.format(url = url_upload.replace(', ','\n\t'))
              params = {'resource':url_upload,'apikey':self.api, 'scan':add_to_scan}
              url   = self.base + 'url/report'

            jdata, response = get_response(url, params=params, method="post")

        if isinstance(jdata, list):

          for jdata_part in jdata:

            if jdata_part['response_code'] == 0 or jdata_part['response_code'] == -1:
              if jdata_part.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata_part['verbose_msg'])
              break

            if dump:
              md5 = hashlib.md5(jdata_part['url']).hexdigest()

            if key == 'report':
                  url_report = True
                  parse_report(jdata_part, md5, verbose, dump, url_report)

            elif key == 'scan':
              if jdata_part.get('verbose_msg') : print '\n\tStatus : {verb_msg}\t{url}'.format(verb_msg  = jdata_part['verbose_msg'], url = jdata_part['url'])
              if jdata_part.get('permalink')   : print '\tPermanent link : {permalink}'.format(permalink = jdata_part['permalink'])

        else:

          if jdata['response_code'] == 0 or jdata['response_code'] == -1:
            if jdata.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata['verbose_msg'])
            sys.exit()

          if dump:
            md5 = hashlib.md5(jdata['url']).hexdigest()

          if key == 'report':
                  url_report = True
                  parse_report(jdata, md5, verbose, dump, url_report)

          elif key == 'scan':
              if jdata.get('verbose_msg') : print '\n\tStatus : {verb_msg}\t{url}'.format(verb_msg  = jdata['verbose_msg'], url = jdata['url'])
              if jdata.get('permalink')   : print '\tPermanent link : {permalink}'.format(permalink = jdata['permalink'])

    def getIP(self, ip, dump=False, detected_urls=False, detected_downloaded_samples=False, undetected_downloaded_samples=False,\
                                                         detected_communicated=False, undetected_communicated=False):

      """
      A valid IPv4 address in dotted quad notation, for the time being only IPv4 addresses are supported.
      """

      result, name = is_file(ip)

      if result:
            jdata = load_file(name)
            dump  = False
            md5   = ''

      else:
          params  = {'ip':ip,'apikey':self.api}
          url     = self.base + 'ip-address/report'

          jdata, response = get_response(url, params=params)


      if jdata['response_code'] == 0 or jdata['response_code'] == -1:
          if jdata.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata['verbose_msg'])
          sys.exit()

      if jdata['response_code'] == 1:
          if jdata.get('verbose_msg') : print '\nStatus: {verb_msg}'.format(verb_msg = jdata['verbose_msg'])

          if jdata.get('detected_downloaded_samples') and detected_downloaded_samples:
              print '\n[+] Latest detected files that were downloaded from this domain/ip\n'
              pretty_print(sorted(jdata['detected_downloaded_samples'], key=methodcaller('get', 'date'), reverse=True), ['positives', 'total','date','sha256'], [15, 10, 20, 70], ['c', 'c', 'c', 'c'])

          print_results(jdata, undetected_downloaded_samples, detected_communicated, undetected_communicated, detected_urls)

          if jdata.get('resolutions'):
              print '\n[+] Lastest domain resolved\n'
              pretty_print(sorted(jdata['resolutions'], key=methodcaller('get', 'last_resolved'), reverse=True), ['last_resolved', 'hostname'])

          if dump == True:
              md5 = hashlib.md5(name).hexdigest()
              jsondump(jdata, md5)

      else:
            if jdata.get('verbose_msg') : print '\n[-] Status: {info}\n'.format(info=jdata['verbose_msg'])
            sys.exit()

    def getDomain(self, domain, dump=False, trendmicro=False, detected_urls=False, undetected_downloaded_samples=False, alexa_domain_info=False,\
                  wot_domain_info=False, websense_threatseeker=False, bitdefender=False, webutation_domain=False,\
                                         detected_communicated=False, undetected_communicated=False, pcaps=False):

        """
        Get domain last scan, detected urls and resolved IPs
        """

        result, name = is_file(domain)

        if result:
            jdata = load_file(name)
            dump  = False
            md5   = ''

        else:
            params  = {'domain':domain,'apikey':self.api}
            url    = self.base + "domain/report"

            jdata, response = get_response(url, params=params)

        if jdata['response_code'] == 0 or jdata['response_code'] == -1:
          if jdata.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata['verbose_msg'])
          sys.exit()

        if jdata.get('response_code') and jdata['response_code'] == 1:

            if jdata.get('verbose_msg') : print '\nStatus : {verb_msg}'.format(verb_msg = jdata['verbose_msg'])

            if jdata.get('TrendMicro category') and trendmicro:

                print '\n[+] TrendMicro category'
                print '\t',jdata['TrendMicro category']

            if jdata.get('Websense ThreatSeeker category') and websense_threatseeker:

                print '\n[+] Websense ThreatSeeker category'
                print '\t', jdata['Websense ThreatSeeker category']

            if jdata.get('BitDefender category') and bitdefender:

                print '\n[+] BitDefender category'
                print '\t', jdata['BitDefender category']

            if jdata.get('Alexa domain info') and alexa_domain_info:

              print '\n[+] Alexa domain info'
              print '\t', jdata['Alexa domain info']

            if jdata.get('WOT domain info') and wot_domain_info:

              print '\n[+] WOT domain info'
              plist = [[]]

              for jdata_part in jdata['WOT domain info']:
                plist.append([jdata_part, jdata['WOT domain info'][jdata_part]])

              pretty_print_special(plist, ['Name', 'Value'], [25, 20], ['c','c'])

              del plist

            if jdata.get('Webutation domain info') and webutation_domain:

              print "\n[+] Webutation"
              plist = [[]]

              for jdata_part in jdata['Webutation domain info']:
                plist.append([jdata_part, jdata['Webutation domain info'][jdata_part]])

              pretty_print_special(plist, ['Name', 'Value'], [25, 20], ['c','c'])

              del plist

            print_results(jdata, undetected_downloaded_samples, detected_communicated, undetected_communicated, detected_urls)

            if jdata.get('pcaps') and pcaps:

              print '\n'
              pretty_print(jdata['pcaps'], ['pcaps'], [70], ['c'])

            if jdata.get('resolutions'):

              print '\n[+] Passive DNS replication\n'
              pretty_print(sorted(jdata['resolutions'], key=methodcaller('get', 'last_resolved'), reverse=True), ['last_resolved', 'ip_address'], [25, 20], ['c', 'c'])

            if dump == True:
                md5 = hashlib.md5(name).hexdigest()
                jsondump(jdata, md5)

        else:
            print '\n[-] {info}\n'.format(info=jdata['verbose_msg'])

    def clusters(self, value, dump = False, by_id = False):

      """
      VirusTotal has built its own in-house file similarity clustering functionality. At present,
      this clustering works only on PE files and is based on a very basic PE feature hash, which
      can be very often confused by certain compression and packing strategies. In other words,
      this clustering logic is no holly grail.

      This API offers a programmatic access to the clustering section of VirusTotal Intelligence:

      https://www.virustotal.com/intelligence/clustering/

      Please note that you must be logged in with a valid VirusTotal Community user with access
      to VirusTotal Intelligence in order to be able to view the clustering listing.

      All of the API responses are JSON objects, if no clusters were identified for the given
      time frame, this JSON will have a response_code property equal to 0, if there was some
      sort of error with your query this code will be set to -1, if your query succeded and
      file similarity clusters were found it will have a value of 1 and the rest of the JSON
      properties will contain the clustering information.
      """

      result, name = is_file(value)

      if result:
            jdata = load_file(name)
            dump  = False
            md5   = ''

      else:
          url    = self.base + 'file/clusters'

          params = {'apikey': self.api}

          if by_id:
            params.setdefault('query', 'cluster:{0}'.format(value))

          else:
            params.setdefault('date', name)

          jdata, response = get_response(url, params=params)

      if jdata['response_code'] == 0 or jdata['response_code'] == -1:
          if jdata.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata['verbose_msg'])
          sys.exit()

      if jdata.get('verbose_msg')    : print '\nStatus : {verb_msg}'.format(verb_msg = jdata['verbose_msg'])
      if jdata.get('size_top200')    : print '\n\tSize top 200   : {size_top200}'.format(size_top200 = jdata['size_top200'])
      if jdata.get('num_clusters')   : print '\tNum Clusters   : {num_clusters}'.format(num_clusters = jdata['num_clusters'])
      if jdata.get('num_candidates') : print '\tNum Candidates : {num_candidates}'.format(num_candidates = jdata['num_candidates'])

      if jdata.get('clusters'):

          plist = [[]]

          for line in jdata['clusters']:
              plist.append([line['label'], line['avg_positives'], line['id'], line['size']])

          pretty_print_special(plist, ['Label', 'AV Detections', 'Id', 'Size'], [40, 15, 80, 8], ['l','c','l','c'])

      if dump:
          jsondump(jdata, 'clusters_{0}'.format(name))

    def comment(self, hash_co, action, dump = False, before_or_comment = False):

      """
      Add comment:
      The actual review, you can tag it using the "#" twitter-like syntax (e.g. #disinfection #zbot) and reference users using the "@" syntax (e.g. @VirusTotalTeam).

      Get comments:
      The application answers with the comments sorted in descending order according to their date. Please note that, for timeout reasons, the application will only
      answer back with at most 25 comments. If the answer contains less than 25 comments it means that there are no more comments for that item. On the other hand,
      if 25 comments were returned you should keep issuing further calls making use of the optional before parameter, this parameter should be fixed to the oldest
      (last in the list) comment's date token, exactly in the same way as returned by your previous API call (e.g. 20120404132340).
      """

      result, name = is_file(hash_co)

      if result:
            jdata = load_file(name)
            dump  = False
            md5   = ''

      else:
        params = {'resource':hash_co,'apikey':self.api}

        if action == 'add':
          url = self.base + 'comments/put'
          params.setdefault('comment',before_or_commentz)

          jdata, response = get_response(url, params=params, method="post")

        elif action == 'get':
          url = self.base + 'comments/get'

          if before_or_comment:
            params.setdefault('before', before_or_comment)

          jdata, response = get_response(url, params=params)

        else:
            print '\n[!] Support only get/add comments action \n'
            sys.exit()

      if jdata['response_code'] == 0 or jdata['response_code'] == -1:
        if jdata.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata['verbose_msg'])
        sys.exit()

      if action == 'add':
          if jdata.get('verbose_msg') : print '\nStatus : {0}\n'.format(jdata['verbose_msg'])

      else:
          if jdata['response_code'] == 0:
            print '\n[!] This analysis doen\'t have any comment\n'

          else:
            if jdata.get('comments'):
              for comment in jdata['comments']:

                date_format   = time.strptime(comment['date'], '%Y%m%d%H%M%S')
                date_formated = '{year}:{month}:{day} {hour}:{minuts}:{seconds}'.format(year = date_format.tm_year,month = date_format.tm_mon,\
                                                                                        day = date_format.tm_mday, hour = date_format.tm_hour,\
                                                                                        minuts = date_format.tm_min, seconds = date_format.tm_sec)

                if comment.get('date')    : print 'Date    : {0}'.format(date_formated)
                if comment.get('comment') : print 'Comment : {0}\n'.format(comment['comment'])

    def download(self, hash_file, file_type = False):

      """
        About pcaps
        VirusTotal runs a distributed setup of Cuckoo sandbox machines that execute the files we receive.
        Execution is attempted only once, upon first submission to VirusTotal, and only Portable Executables
        under 10MB in size are ran. The execution of files is a best effort process, hence, there are no guarantees
        about a report being generated for a given file in our dataset.

        Files that are successfully executed may communicate with certain network resources, all this communication
        is recorded in a network traffic dump (pcap file). This API allows you to retrieve the network traffic dump
        generated during the file's execution.

        The md5/sha1/sha256 hash of the file whose network traffic dump you want to retrieve.
      """

      result, name = is_file(hash_file)

      if result:
            print '\n[!]Hash cannot be file\n'
            sys.exit()
      else:
        params = {'apikey': self.api, 'hash': hash_file}

        if file_type == 'pcap':
          jdata, response = get_response(self.base + 'file/network-traffic', params=params)
          name = 'VTDL_{hash}.pcap'.format(hash = hash_file)

        elif file_type == 'file':
          jdata, response = get_response(self.base + 'file/download', params=params)

          if jdata['response_code'] == 0 or jdata['response_code'] == -1:
            if jdata.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata['verbose_msg'])
            sys.exit()

          name = 'VTDL_{hash}.dangerous'.format(hash = hash_file)

        else:
            print '\n[!] File_type must be pcap or file\n'
            sys.exit()


        file_save = response.content
        if len(file_save) > 0 and '{"response_code": 0, "hash":' not in file_save :
          fo = open(name,"w")
          fo.write(file_save)
          fo.close()
          print '\n\tDownloaded to File -- {name}\n'.format(name = name)

    def distribution(self, local_file, action, before = False, after = False, reports = False, limit = False, allinfo = False, dump = False):

      """
      Note that scan items are not kept forever in the distribution queue, they are automatically removed after 6 hours counting from the time
      they were put in the queue. You have a 6 hours time frame to get an item from the queue. The timestamp property value is what you need to
      iterate through your queue using the before and after call parameters.
      """

      result, name = is_file(local_file)

      if result:
            jdata = load_file(name)
            dump  = False

      else:
            params = {'apikey':self.api}

            if before:
                  params.setdefault('before', before)

            if after:
                  params.setdefault('after', after)

            if limit:
                  params.setdefault('limit', limit)

            if action == 'file':

                  if reports:
                        params.setdefault('reports', str(reports).lower())

                  url = self.base + 'file/distribution'

            elif action == 'url':

                  if allinfo:

                        params.setdefault('allinfo', '1')

                  url = self.base + 'url/distribution'

            jdata, response = get_response(url, params=params)

      if jdata['response_code'] == 0 or jdata['response_code'] == -1:
        if jdata.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata['verbose_msg'])
        sys.exit()

      for vt_file in jdata:

            if action == 'file':

              try:
                 if vt_file.get('name') : print '\n\nName   : {name}'.format(name = vt_file['name'])

              except UnicodeEncodeError:
                print ''

              if vt_file.get('md5')    : print '\nMD5    : {md5}'.format(    md5 = vt_file['md5'])
              if vt_file.get('sha1')   : print 'SHA1   : {sha1}'.format(    sha1 = vt_file['sha1'])
              if vt_file.get('sha256') : print 'SHA256 : {sha256}'.format(sha256 = vt_file['sha256'])

              if vt_file.get('filetype') : print '\nType   : {filetype}'.format(filetype = vt_file['filetype'])
              if vt_file.get('size')     : print 'Size   : {size}'.format(size = vt_file['size'])

              if vt_file.get('source_id')  : print 'Source Id  : {source_id}'.format(source_id   = vt_file['source_id'])
              if vt_file.get('first_seen') : print 'First Seen : {first_seen}'.format(first_seen = vt_file['first_seen'])
              if vt_file.get('last_seen')  : print 'Last  Seen : {last_seen}'.format(  last_seen = vt_file['last_seen'])

              if vt_file.get('report'):

                plist = [[]]

                for key in vt_file['report']:
                  plist.append([key, 'True' if jdata[0]['report'][key][0] else 'False', jdata[0]['report'][key][1], jdata[0]['report'][key][2]])

                pretty_print_special(plist, ['Vendor name', 'Detection', 'Version', 'Update'])

              if vt_file.get('link') : print '\nLink : {link}'.format(link = vt_file['link'])

            elif action == 'url':

              if vt_file.get('scan_date')  : print '\nScan Date : {scan_date}'.format(scan_date = vt_file['scan_date'])
              if vt_file.get('last_seen')  : print 'Last Seen : {last_seen}'.format(  last_seen = vt_file['last_seen'])
              if vt_file.get('positives') and vt_file.get('total') : print '\nDetections:\n\t{positives}/{total} Positives/Total\n'.format(positives = vt_file['positives'], total = vt_file['total'])

              if vt_file.get('score') : print 'Score     : {score}'.format(score = vt_file['score'])
              if vt_file.get('url')   : print 'Url       : {url}'.format(    url = vt_file['url'])

              if vt_file.get('timestamp') : print 'Timestamp : {timestamp}'.format(timestamp = vt_file['timestamp'])

              if vt_file.get('additional_info'):

                    print '\n\nAdditional info:'
                    plist = [[]]

                    for key in vt_file['additional_info']:

                        if isinstance(vt_file['additional_info'][key], dict):
                          plist.append([key, ''.join(map(lambda key_temp:'{key_temp}:{value}\n'.format(key_temp=key_temp, value=vt_file['additional_info'][key][key_temp]), vt_file['additional_info'][key]))])

                        elif isinstance(vt_file['additional_info'][key], list):
                          plist.append([key, '\n'.join(vt_file['additional_info'][key])])

                        else:
                          plist.append([key, vt_file['additional_info'][key]])

                    pretty_print_special(plist, ['Name', 'Value'],[40, 70])

              if vt_file.get('scans'):

                    plist = [[]]

                    for key in vt_file['scans']:

                          plist.append([key, 'True' if vt_file['scans'][key]['detected'] else 'False', vt_file['scans'][key]['result']])

                    pretty_print_special(plist, ['Vendor name', 'Detection', 'Result'])


              if vt_file.get('permalink') : print '\nPermanent link : {link}\n'.format(link = vt_file['permalink'])

      if dump:
            jsondump(jdata, 'distribution_{date}'.format(date = time.strftime("%Y-%m-%d")))

    def behaviour(self, search_hash, dump = False, network = False, process = False, summary = False):

      result, name = is_file(search_hash)

      if result:
            jdata = load_file(name)
            dump  = False

      else:
            params = {'apikey': self.api, 'hash': search_hash}
            url    = self.base + 'file/behaviour'

            jdata, response = get_response(url, params=params)

      if jdata['response_code'] == 0 or jdata['response_code'] == -1:
          if jdata.get('verbose_msg') : print '\n[!] Status : {verb_msg}\n'.format(verb_msg = jdata['verbose_msg'])
          sys.exit()

      print '\nInfo\n'

      pretty_print(jdata['info'], ['started', 'ended', 'duration', 'version'])

      if network:

            print '\nHTTP requests\n'

            if jdata.get('network') and jdata['network'].get('http'):
              for http in jdata['network']['http']:

                if http.get('uri')  : print '\tURL        : {0}'.format(http['uri'])
                if http.get('host') : print '\tHost       : {0}'.format(http['host'])
                #if http.get('port') : print 'port       : {0}'.format(http['port'])
                #if http.get('path') : print 'path       : {0}'.format(http['path'])
                if http.get('method')     : print '\tMethod     : {0}'.format(http['method'])
                if http.get('user-agent') : print '\tUser-agent : {0}'.format(http['user-agent'])
                #if http.get('version') : print 'version    : {0}'.format(http['version'])
                #if http.get('data')    : print 'data       : {0}'.format(http['data'].replace('\r\n\r\n', '\n\t').replace('\r\n','\n\t\t'))
                #if http.get('body')    : print 'body       : {0}'.format(http['body'])
                print '\n'

            pretty_print(jdata['network']['hosts'], ['hosts'])

            print '\nDNS requests\n'
            pretty_print(jdata['network']['dns'],   ['ip', 'hostname'])

            print '\nTCP Connections\n'

            unique = []

            for block in jdata['network']['tcp']:

                  if not [block['src'],  block['dst'], block['sport'], block['dport']] in unique:

                        unique.append([block['src'], block['dst'], block['sport'], block['dport']])

            pretty_print_special(unique,   ['src', 'dst', 'sport', 'dport'])

            del unique

            print '\nUDP Connections'

            unique = []

            for block in jdata['network']['udp']:

                  if not [block['src'],  block['dst'], block['sport'], block['dport']] in unique:

                        unique.append([block['src'], block['dst'], block['sport'], block['dport']])

            pretty_print_special(unique,   ['src', 'dst', 'sport', 'dport'])

            del unique

      if process:
            print '\nBehavior\n'
            print '\nProcesses\n'

            for process_id in jdata['behavior']['processes']:

                plist = []

                if process_id.get('parent_id')  : print '\nParent  Id : {0}'.format(process_id['parent_id'])
                if process_id.get('process_id') : print 'Process Id : {0}'.format(process_id['process_id'])

                if process_id.get('first_seen') :

                    date_format   = time.strptime(process_id['first_seen'][:14], '%Y%m%d%H%M%S')
                    date_formated = '{year}:{month}:{day} {hour}:{minuts}:{seconds}'.format(year = date_format.tm_year,month = date_format.tm_mon,\
                                                                                              day = date_format.tm_mday, hour = date_format.tm_hour,\
                                                                                              minuts = date_format.tm_min, seconds = date_format.tm_sec)
                    print 'First Seen : {0}'.format(date_formated)

                if process_id.get('process_name') : print '\nProcess Name : {0}'.format(process_id['process_name'])

                if process_id.get('calls'):

                    for process_part in process_id['calls']:

                        plist = [[]]

                        for key in process_part:

                              if isinstance(process_part[key], list):
                                    if process_part[key] != [] and isinstance(process_part[key][0], dict):

                                        temp_list = []

                                        for part in process_part[key]:

                                            temp_list.append('\n'.join(map(lambda key_temp:'{key_temp}:{value}\n'.format(key_temp=key_temp, value=part[key_temp]), part.keys())))

                                        plist.append([key, ''.join(temp_list)])

                                        del temp_list
                                    else:
                                        plist.append([key, '\n'.join(process_part[key])])

                              elif isinstance(process_part[key], dict):

                                  temp_list = []

                                  for part in process_part[key]:
                                      temp_list += map(lambda key_temp:'{key_temp}:{value}\n'.format(key_temp=key_temp, value=part[key_temp]), part.keys())

                                  plist.append([key, ''.join(temp_list)])

                                  del temp_list
                              else:
                                  plist.append([key, process_part[key]])

                        pretty_print_special(plist, ['Name', 'Value'], [10, 50])

                        del plist

                    print '\n'+'='*20+' FIN '+'='*20


            print '\nProcess Tree\n'
            for tree in jdata['behavior']['processtree']:
              for key in tree.keys():
                print '\t{key}:{value}'.format(key=key, value=tree[key])
            print '\n'

      if summary:

            print '\nOpened files\n'
            pretty_print(sorted(jdata['behavior']['summary']['files']), ['files'], [150])

            print '\nSet keys\n'
            pretty_print(sorted(jdata['behavior']['summary']['keys']), ['keys'], [150])

            print '\nCreated mutexes\n'
            pretty_print(sorted(jdata['behavior']['summary']['mutexes']), ['mutexes'], [100])

      if dump == True:
          md5 = hashlib.md5(name).hexdigest()
          jsondump(jdata, md5)


def main(apikey):
  opt=argparse.ArgumentParser('value',description='Scan/Search/ReScan/JSON parse')

  opt.add_argument('value', nargs='*', help='Enter the Hash, Path to File(s) or Url(s)')
  opt.add_argument('-c', '--config-file', action='store',  default='~/.vtapi', help='Path to configuration file')

  opt.add_argument('-fs', '--file-search', action='store_true',               help='File(s) search, this option, don\'t upload file to VirusTotal, just search by hash, support linux name wildcard, example: /home/user/*malware*, if file was scanned, you will see scan info, for full scan report use verbose mode, and dump if you want save already scanned samples')
  opt.add_argument('-f',  '--file-scan',   action='store_true', dest='files', help='File(s) scan, support linux name wildcard, example: /home/user/*malware*, if file was scanned, you will see scan info, for full scan report use verbose mode, and dump if you want save already scanned samples')
  opt.add_argument('-u',  '--url-scan',    action='store_true',               help='Url scan, support space separated list, Max 4 urls (or 25 if you have private api)')
  opt.add_argument('-ur', '--url-report',  action='store_true',               help='Url(s) report, support space separated list, Max 4 (or 25 if you have private api) urls, you can use --url-report --url-scan options for analysing url(s) if they are not in VT data base')

  opt.add_argument('-d', '--domain-info',   action='store_true', dest='domain',  help='Retrieves a report on a given domain (PRIVATE API ONLY! including the information recorded by VirusTotal\'s Passive DNS infrastructure)')
  opt.add_argument('-i', '--ip-info',       action='store_true', dest='ip',      help='A valid IPv4 address in dotted quad notation, for the time being only IPv4 addresses are supported.')
  opt.add_argument('-s', '--search',        action='store_true',                 help='A md5/sha1/sha256 hash for which you want to retrieve the most recent report. You may also specify a scan_id (sha256-timestamp as returned by the scan API) to access a specific report. You can also specify a space separated list made up of a combination of hashes and scan_ids Public API up to 4 items/Private API up to 25 items, this allows you to perform a batch request with one single call.')
  opt.add_argument('--report-all-info',     action='store_true',                 help='PRIVATE API ONLY! If specified and set to one, the call will return additional info, other than the antivirus results, on the file being queried. This additional info includes the output of several tools acting on the file (PDFiD, ExifTool, sigcheck, TrID, etc.), metadata regarding VirusTotal submissions (number of unique sources that have sent the file in the past, first seen date, last seen date, etc.), and the output of in-house technologies such as a behavioural sandbox.')
  opt.add_argument('-ac', '--add-comment',  action='store_true',                 help='The actual review, you can tag it using the "#" twitter-like syntax (e.g. #disinfection #zbot) and reference users using the "@" syntax (e.g. @VirusTotalTeam). supported hashes MD5/SHA1/SHA256')
  opt.add_argument('-gc', '--get-comments', action='store_true',                 help='Either a md5/sha1/sha256 hash of the file or the URL itself you want to retrieve')
  opt.add_argument('--get-comments-before', action='store',      dest='date',default=False,  help='PRIVATE API ONLY! A datetime token that allows you to iterate over all comments on a specific item whenever it has been commented on more than 25 times. Token format 20120725170000 or 2012-07-25 17 00 00 or 2012-07-25 17:00:00')

  opt.add_argument('-v', '--verbose', action='store_true', dest='verbose', help='Turn on verbosity of VT reports')
  opt.add_argument('-j', '--dump',    action='store_true',                 help='Dumps the full VT report to file (VTDL{md5}.json), if you (re)scan many files/urls, their json data will be dumped to separetad files')

  rescan = opt.add_argument_group('Rescan options')
  rescan.add_argument('-r', '--rescan', action='store_true',              help='Allows you to rescan files in VirusTotal\'s file store without having to resubmit them, thus saving bandwidth., support space separated list, MAX 25 hashes')
  rescan.add_argument('--delete',       action='store_true',              help='PRIVATE API ONLY! A md5/sha1/sha256 hash for which you want to delete the scheduled scan')
  rescan.add_argument('--date',         action='store',      dest='date', help='PRIVATE API ONLY! A Date in one of this formats (example: 20120725170000 or 2012-07-25 17 00 00 or 2012-07-25 17:00:00) in which the rescan should be performed. If not specified the rescan will be performed immediately.')
  rescan.add_argument('--period',       action='store',                   help='PRIVATE API ONLY! Period in days in which the file should be rescanned. If this argument is provided the file will be rescanned periodically every period days, if not, the rescan is performed once and not repated again.')
  rescan.add_argument('--repeat',       action='store',                   help='PRIVATE API ONLY! Used in conjunction with period to specify the number of times the file should be rescanned. If this argument is provided the file will be rescanned the given amount of times, if not, the file will be rescanned indefinitely.')

  scan_rescan = opt.add_argument_group('File scan/Rescan shared options')
  scan_rescan.add_argument('--notify-url',          action='store',      help='PRIVATE API ONLY! An URL where a POST notification should be sent when the scan finishes.')
  scan_rescan.add_argument('--notify-changes-only', action='store_true', help='PRIVATE API ONLY! Used in conjunction with --notify-url. Indicates if POST notifications should be sent only if the scan results differ from the previous one.')

  domain_opt = opt.add_argument_group('Domain/IP shared verbose mode options, by default just show resolved IPs/Passive DNS')
  domain_opt.add_argument('--alexa-domain-info',             action='store_true', default=False, help='Just Domain option: Show Alexa domain info')
  domain_opt.add_argument('--wot-domain-info',               action='store_true', default=False, help='Just Domain option: Show WOT domain info')
  domain_opt.add_argument('--trendmicro',                    action='store_true', default=False, help='Just Domain option: Show TrendMicro category info')
  domain_opt.add_argument('--websense-threatseeker',         action='store_true', default=False, help='Just Domain option: Show Websense ThreatSeeker category')
  domain_opt.add_argument('--bitdefender',                   action='store_true', default=False, help='Just Domain option: Show BitDefender category')
  domain_opt.add_argument('--webutation-domain',             action='store_true', default=False, help='Just Domain option: Show Webutation domain info')
  domain_opt.add_argument('--detected-urls',                 action='store_true', default=False, help='Just Domain option: Show latest detected URLs')
  domain_opt.add_argument('--pcaps',                         action='store_true', default=False, help='Just Domain option: Show all pcaps hashes')
  domain_opt.add_argument('--detected-downloaded-samples',   action='store_true', default=False, help='Domain/Ip options: Show latest detected files that were downloaded from this ip')
  domain_opt.add_argument('--undetected-downloaded-samples', action='store_true', default=False, help='Domain/Ip options: Show latest undetected files that were downloaded from this domain/ip')
  domain_opt.add_argument('--detected-communicated',         action='store_true', default=False, help='Domain/Ip Show latest detected files that communicate with this domain/ip')
  domain_opt.add_argument('--undetected-communicated',       action='store_true', default=False, help='Domain/Ip Show latest undetected files that communicate with this domain/ip')

  behaviour = opt.add_argument_group('Behaviour options - PRIVATE API ONLY!')
  behaviour.add_argument('--behaviour', action='store_true',  help='The md5/sha1/sha256 hash of the file whose dynamic behavioural report you want to retrieve.\
                       VirusTotal runs a distributed setup of Cuckoo sandbox machines that execute the files we receive. Execution is attempted only once, upon\
                       first submission to VirusTotal, and only Portable Executables under 10MB in size are ran. The execution of files is a best effort process,\
                       hence, there are no guarantees about a report being generated for a given file in our dataset. a file did indeed produce a behavioural report,\
                       a summary of it can be obtained by using the file scan lookup call providing the additional HTTP POST parameter allinfo=1. The summary will\
                       appear under the behaviour-v1 property of the additional_info field in the JSON report.This API allows you to retrieve the full JSON report\
                       of the file\'s execution as outputted by the Cuckoo JSON report encoder.')

  behaviour.add_argument('--behavior-network',     action='store_true', help='Show network activity')
  behaviour.add_argument('--behavior-process',     action='store_true', help='Show processes')
  behaviour.add_argument('--behavior-summary',     action='store_true', help='Show summary')


  private = opt.add_argument_group('Additional PRIVATE API options')
  private.add_argument('--pcap',                 action='store_true', help='The md5/sha1/sha256 hash of the file whose network traffic dump you want to retrieve. Will save as VTDL_{hash}.pcap')
  private.add_argument('--download',             action='store_true', help='The md5/sha1/sha256 hash of the file you want to download. Will save as VTDL_{hash}.dangerous')
  private.add_argument('--clusters',             action='store_true', help='A specific day for which we want to access the clustering details, example: 2013-09-10')
  #private.add_argument('--search-by-cluster-id', action='store_true', help=' the id property of each cluster allows users to list files contained in the given cluster, example: vhash 0740361d051)z1e3z 2013-09-10')
  private.add_argument('--distribution-files',   action='store_true', help='Timestamps are just integer numbers where higher values mean more recent files. Both before and after parameters are optional, if they are not provided the oldest files in the queue are returned in timestamp ascending order.')
  private.add_argument('--distribution-urls',    action='store_true', help='Timestamps are just integer numbers where higher values mean more recent urls. Both before and after parameters are optional, if they are not provided the oldest urls in the queue are returned in timestamp ascending order.')

  dist = opt.add_argument_group('Distribution options - PRIVATE API ONLY!')
  dist.add_argument('--before',       action='store',                     help='File/Url option. Retrieve files/urls received before the given timestamp, in timestamp descending order.')
  dist.add_argument('--after',        action='store',                     help='File/Url option. Retrieve files/urls received after the given timestamp, in timestamp ascending order.')
  dist.add_argument('--reports',      action='store_true', default=False, help='Include the files\' antivirus results in the response. Possible values are \'true\' or \'false\' (default value is \'false\').')
  dist.add_argument('--limit',        action='store',                     help='File/Url option. Retrieve limit file items at most (default: 1000).')
  dist.add_argument('--allinfo',      action='store_true',                help='will include the results for each particular URL scan (in exactly the same format as the URL scan retrieving API). If the parameter is not specified, each item returned will onlycontain the scanned URL and its detection ratio.')
  dist.add_argument('--massive-download', action='store_true', default=False, help='Show information how to get massive download work')

  options = opt.parse_args()

  #it's just a check, if you want set your apikey into value, go to the end of file
  if apikey == '<--------------apikey-here-------->':

      apikey = parse_conf(options.config_file)

      if apikey is None:
            sys.exit('No API key provided and cannot read ~/.vtapi. Specify an API key in vt.py or in ~/.vtapi or  in your file')

  vt=vtAPI(apikey)

  if options.date:
      options.date = options.date.replace('-','').replace(':','').replace(' ','')

  if options.verbose and (options.domain or options.ip or options.behaviour):
    options.detected_urls = options.undetected_downloaded_samples = options.wot_domain_info  = options.websense_threatseeker   = \
                            options.detected_communicated         = options.trendmicro       = options.undetected_communicated = \
                            options.alexa_domain_info             = options.bitdefender      = options.webutation_domain       = options.pcaps = \
                            options.detected_downloaded_samples   = options.behavior_network = options.behavior_process        = options.behavior_summary = True

  if options.files:
    vt.fileScan(options.value, options.verbose, options.notify_url, options.notify_changes_only, options.dump, scan = True)

  elif options.file_search:
      vt.fileScan(options.value, options.verbose, options.notify_url, options.notify_changes_only, options.dump)

  elif options.url_scan and not options.url_report:
    vt.url_scan_and_report(options.value, "scan", options.verbose, options.dump)

  elif options.url_report:
      action = 0

      if options.url_scan:
            action = 1

      vt.url_scan_and_report(options.value, "report", options.verbose, options.dump, action)

  elif options.rescan:

    if options.date:

      if len(options.date) < 14:
         print '\n[!] Date fotmar is: 20120725170000 or 2012-07-25 17 00 00 or 2012-07-25 17:00:00\n'
         sys.exit()

      now = time.strftime("%Y:%m:%d %H:%M:%S")
      if now >= relativedelta(options.date):
            print '\n[!] Date must be greater then today\n'
            sys.exit()

    vt.rescan(options.value, options.date, options.period, options.repeat, options.notify_url, options.notify_changes_only, options.delete)

  elif options.domain:
    vt.getDomain(options.value[0], options.dump, options.trendmicro, options.detected_urls, options.undetected_downloaded_samples, options.alexa_domain_info,\
                 options.wot_domain_info, options.websense_threatseeker, options.bitdefender, options.webutation_domain, options.detected_communicated,\
                 options.undetected_communicated, options.pcaps)

  elif options.ip:
    vt.getIP(options.value[0], options.dump, options.detected_urls, options.detected_downloaded_samples, options.undetected_downloaded_samples,\
             options.detected_communicated, options.undetected_communicated)

  elif options.report_all_info:
      vt.getReport(options.value, '1', options.verbose, options.dump)

  elif options.search and not options.domain and not options.ip and not options.url_scan and not options.url_report:
    vt.getReport(options.value, '0', options.verbose, options.dump)

  elif options.download:
      vt.download(options.value[0], 'file')

  elif options.pcap:
      vt.download(options.value[0], 'pcap')

  elif options.behaviour:
      vt.behaviour(options.value[0], options.dump, options.behavior_network, options.behavior_process, options.behavior_summary)

  elif options.distribution_files:
      vt.distribution(options.value, 'file', options.before, options.after, options.reports, options.limit, False, options.dump)

  elif options.distribution_urls:
      vt.distribution(options.value, 'url', options.before, options.after, options.reports, options.limit, options.allinfo, options.dump)

  elif options.massive_download:
      print """
            [!] If you want massive download files check this script:\n\t https://www.virustotal.com/es/documentation/scripts/vtfiles.py
            """
      sys.exit()

  elif options.add_comment and len(options.value) == 2:
    vt.comment(options.value[0], 'add', options.dump, options.value[1])

  elif options.get_comments:
    vt.comment(options.value[0], 'get', options.dump, options.date)

  elif options.clusters:
      vt.clusters(options.value, options.dump)

  #elif options.search_by_cluster_id:
  #    vt.clusters(options.value, options.dump, True)

  else:

    sys.exit(opt.print_help())

if __name__ == '__main__':
    '''
    You can especificate apikey as value or put it to config file
    '''

    apikey = '<--------------apikey-here-------->'

    main(apikey)

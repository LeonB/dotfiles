"zeitgeist.vim - a Zeitgeist logger for Vim
"Author : Jonathan Lambrechts <jonathanlambrechts@gmail.com>
"Installation : drop this file in a vim plugin folder ($HOME/.vim/plugin,/usr/share/vim/vim72/plugin, ...). Vim should be compiled with python enabled.

function! ZeitgeistLog(filename, vim_use_id)
python << endpython
use_id = vim.eval("a:vim_use_id")
filename = vim.eval("a:filename")
precond = os.getuid() != 0 and os.getenv('DBUS_SESSION_BUS_ADDRESS') != None
if got_zeitgeist and precond and filename:
  use = {
    "read" : Interpretation.ACCESS_EVENT,
    "new" : Interpretation.CREATE_EVENT,
    "write" : Interpretation.MODIFY_EVENT} [use_id]

  try:
    f = gio.File(filename)
    fi = f.query_info(gio.FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE)
    uri = f.get_uri()
    mimetype = fi.get_content_type()
  except gio.Error:
    pass
  else:
    subject = Subject.new_for_values(
      uri=unicode(uri),
      text=unicode(uri.rpartition("/")[2]),
      interpretation=unicode(Interpretation.DOCUMENT),
      manifestation=unicode(Manifestation.FILE_DATA_OBJECT),
      origin=unicode(uri.rpartition("/")[0]),
      mimetype=unicode(mimetype)
    )
    # print "subject: %r" % subject
    event = Event.new_for_values(
      timestamp=int(time.time()*1000),
      interpretation=unicode(use),
      manifestation=unicode(Manifestation.USER_ACTIVITY),
      actor="application://gvim.desktop",
      subjects=[subject,]
    )
    # print "event: %r" % event
    zeitgeistclient.insert_event(event)
    # print "insert done"
endpython
endfunction

python << endpython
import os
import time
import dbus
import vim
try:
  import gio
  from zeitgeist.client import ZeitgeistClient
  from zeitgeist.datamodel import Subject, Event, Interpretation, Manifestation
  zeitgeistclient = ZeitgeistClient()
  got_zeitgeist = True
except (RuntimeError, ImportError, dbus.exceptions.DBusException):
  got_zeitgeist = False
endpython
augroup zeitgeist
au!
au BufRead * call ZeitgeistLog (expand("%:p"), "read")
au BufNewFile * call ZeitgeistLog (expand("%:p"), "new")
au BufWrite * call ZeitgeistLog (expand("%:p"), "write")
augroup END

" vim: sw=2

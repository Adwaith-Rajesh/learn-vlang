// import net.http.mime {get_mime_type}
import os

#flag -lmagic
#include "magic.h"

fn C.magic_open(int) C.magic_t
fn C.magic_load(C.magic_t, &char)
fn C.magic_file(C.magic_t, &char) &char
fn C.magic_close(C.magic_t)

fn main() {
	//  println(get_mime_type('txt'))
	// println('hello')

	m := C.magic_open(C.MAGIC_MIME_TYPE)
	C.magic_load(m, 0)
	println(unsafe { (C.magic_file(m, os.args[1].str)).vstring() })
	C.magic_close(m)
}

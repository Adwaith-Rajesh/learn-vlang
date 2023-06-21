module main

import os
import regex as re

fn main() {
    mut r, _, _ := re.regex_base('fn [a-zA-Z0-9]+_parser\(\)')

    file_contents := os.read_file('new.txt') or {
        eprintln('Could not read file ${err}')
        return
    }
    println(file_contents)
    fn_names := r.find_all_str(file_contents).map(fn (name string) string {
        return name.split('_')#[..-1].join('/')[3..].clone()
    })
    println(fn_names)
}

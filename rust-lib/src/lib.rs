#![deny(warnings)]

use std::ffi::CString;
use std::os::raw::c_char;

#[repr(C)]
#[derive(Debug)]
pub struct InputValues {
    pub x: i64,
    pub y: i64,
    pub z: i64,
}

#[no_mangle]
#[allow(non_snake_case)]
pub extern "C" fn InputValues_to_string(this: &InputValues) -> *mut c_char {
    CString::new(format!("({}, {}, {})", this.x, this.y, this.z))
        .unwrap()
        .into_raw()
}

#[repr(C)]
#[derive(Debug)]
pub struct OutputValues {
    pub x: i64,
    pub y: i64,
    pub z: i64,
}

#[no_mangle]
#[allow(non_snake_case)]
pub extern "C" fn OutputValues_to_string(this: &OutputValues) -> *mut c_char {
    CString::new(format!("({}, {}, {})", this.x, this.y, this.z))
        .unwrap()
        .into_raw()
}

#[no_mangle]
pub extern "C" fn compute_values(input: &InputValues, scale: i64) -> OutputValues {
    OutputValues {
        x: input.x * scale,
        y: input.y * scale,
        z: input.z * scale,
    }
}

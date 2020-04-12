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
pub extern "C" fn reorder_values(inputs: *mut i64, len: usize) {
    let inputs_slice = unsafe {
        assert!(!inputs.is_null());
        std::slice::from_raw_parts_mut(inputs, len)
    };

    inputs_slice.reverse();
}

#[no_mangle]
pub extern "C" fn compute_values(input: &InputValues, scale: i64) -> OutputValues {
    OutputValues {
        x: input.x * scale,
        y: input.y * scale,
        z: input.z * scale,
    }
}

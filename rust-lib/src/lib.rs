#![deny(warnings)]

#[no_mangle]
pub extern "C" fn compute_value_a(x: i32, y: i32) -> i32 {
    x * y
}

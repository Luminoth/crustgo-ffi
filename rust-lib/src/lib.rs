#![deny(warnings)]

#[no_mangle]
pub extern "C" fn compute_value_a() {
    println!("Hello from Rust!");
}

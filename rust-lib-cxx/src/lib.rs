#![deny(warnings)]

#[cxx::bridge(namespace = "energonsoftware")]
mod ffi {
    #[derive(Debug)]
    struct InputValues {
        pub x: i64,
        pub y: i64,
        pub z: i64,
    }

    #[derive(Debug)]
    struct OutputValues {
        pub x: i64,
        pub y: i64,
        pub z: i64,
    }

    extern "Rust" {
        fn InputValues_to_string(v: &InputValues) -> String;

        fn OutputValues_to_string(v: &OutputValues) -> String;

        fn compute_values(input: &InputValues, scale: i64) -> OutputValues;

        fn reorder_values(inputs: &mut [i64]);
    }
}

#[allow(non_snake_case)]
fn InputValues_to_string(this: &ffi::InputValues) -> String {
    format!("({}, {}, {})", this.x, this.y, this.z)
}

#[allow(non_snake_case)]
fn OutputValues_to_string(this: &ffi::OutputValues) -> String {
    format!("({}, {}, {})", this.x, this.y, this.z)
}

fn reorder_values(inputs: &mut [i64]) {
    inputs.reverse();
}

fn compute_values(input: &ffi::InputValues, scale: i64) -> ffi::OutputValues {
    ffi::OutputValues {
        x: input.x * scale,
        y: input.y * scale,
        z: input.z * scale,
    }
}

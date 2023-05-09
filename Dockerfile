# Use an existing Rust image as the base
FROM rust:1.68.2

RUN cargo install diesel_cli --no-default-features --features postgres

RUN cargo install cargo-watch

# Set the working directory
WORKDIR /app

# Copy the application files into the image
COPY . .

RUN rustup default nightly
RUN cargo build

# Set the command to run the binary
CMD ["./target/release/web-api"]

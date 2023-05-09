# Use an existing Rust image as the base
FROM rust:1.68.2

ENV ROCKET_ADDRESS=0.0.0.0
ENV ROCKET_PORT=6666

# Set the working directory
WORKDIR /app

# Copy the application files into the image
COPY . .

RUN rustup default nightly
RUN cargo build

# Set the command to run the binary
CMD ["./target/release/web-api"]

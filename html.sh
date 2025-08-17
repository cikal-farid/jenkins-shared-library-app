#!/bin/bash

# Fungsi untuk menguji index.html
function test_html() {
    echo "Testing index.html..."
    htmlhint dist/index.html
}

# Periksa argumen yang diberikan
case "$1" in
    "test")
        test_html
        ;;
    *)
        echo "Usage: $0 test"
        exit 1
        ;;
esac

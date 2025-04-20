package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	log.Println("Server starting on :8080")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello from FightPicks!")
	})
	http.ListenAndServe(":8080", nil)
}

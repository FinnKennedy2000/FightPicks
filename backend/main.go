
package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "FightPicks server is running")
	})

	fmt.Println("Listening on port 8080...")
	http.ListenAndServe(":8080", nil)
}

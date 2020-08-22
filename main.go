package main

import (
	"fmt"
	"log"
	"io/ioutil"
	"net/http"
	)


func main() {
	fmt.Println("This is the main function..")
	resp, err := http.Get("https://httpbin.org/get")
	if err != nil {
		log.Fatalln(err)
	}

	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatalln(err)
	}

	log.Println(string(body))
}

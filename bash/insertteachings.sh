#!/usr/bin/env bash

rake thing:work[1,2,3]

rails runner 'Pdf.create({
               title: "wittgen",
               file: File.new("/home/sandro/Downloads/wittgensteinmoralrealism.pdf")
           })'

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import * as ScanditSDK from "scandit-sdk";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

const infos = {}

const formName = document.querySelector("#product_name")
const formCompo = document.querySelector("#product_composition")
const form = document.querySelector("#new_product")

ScanditSDK.configure("Ac8BhRrjO+qOPf6R1DbGBRkoidOTFGOlQ2B8oQEVai+rCoavfjZAtrATZ0THWx0e+lppTDB7VL6QXpOK8RGvJL96sy2VcjzF6nXyWclUa1SoV1gQL2fQ0JhtYIwiSGBljyyvEOcUlyWVBMQNUwrjWLp5/pmgYh87diShzkALTKoeUveRJYl6v7c8R1C56XCtCnzjqdCvStFhd1tAJP8y0o9dn9iJ+ltNswaPW7S1lr6zXtanPbaYKQwJQG2Sm2r2v2n7u+3qZefaioVbWTvAWAJygzrvHI4z25U2ADsIKyV2Pkcx6tacWtPM+xXQ/H5hYuGPT2s+FjwL5Hx5O6bo9k/IDmAP5r5HtuzIn+uqQT1/4zDtmbcFxnjCBaWQ5ylsVrCvgVTIiYC7hObE0+mqjz9d0vRV7cPJMg9DxWZ4u6zPLRBS5kem0tVgTy0EUt1avBsqLtZslko9VO1/7bISxWXvUOL6B1d+Q6GIcaBPqIWBheSZTdDaF2ehyvYUur3J24OfTLK5L/GV2oofmi4HwmqOs2hrZZMMGNXpO5oLe8Zn3GFQGrcSFFta3exGHgvzLzykrggM6aqsaZeU8WXWw+F01f40e5/BMWl6oF7wqbfEegnHcWfuGIB46/biCiB82+m2s9mbp1EvVinRpXIdEoqrsnSgvPI9Y7qeQfnOGoVTNF7qhTxuuNWbbAl/x+Q+V7bVVqLiYsAFAp3jNZJMmr/5hofm2G55uW73Xr1/b8J5Mu6QYYA+zMJDBFSluz4wZg9BgdYffv0GzYTJ4my8uh9xaUwjf9JqcHO3XZgBQzLCQ8s+9vRKnn6P0czfRl/36m52cGBsoyj3cEk3qw==", {
  engineLocation: "https://cdn.jsdelivr.net/npm/scandit-sdk@5.x/build/",
})
  .then(() => {
    return ScanditSDK.BarcodePicker.create(document.getElementById("scandit-barcode-picker"), {
      // enable some common symbologies
      scanSettings: new ScanditSDK.ScanSettings({ enabledSymbologies: ["ean8", "ean13", "upca", "upce"] }),
    });
  })
  .then((barcodePicker) => {
    // barcodePicker is ready here, show a message every time a barcode is scanned
    barcodePicker.on("scan", (scanResult) => {
      searchProducts(scanResult.barcodes[0].data)
      console.log(formName.value)
      form.submit();
    });
  });


  const searchProducts = (query) => {
    fetch(`https://world.openfoodfacts.org/api/v2/product/${query}`)
      .then(response => response.json())
      .then((data) => {
          formName.value = data.product.product_name_fr;
          formCompo.value = data.product.ingredients_text_debug
        })
      }
      // console.log(form)
      // infos.img = data.product.image_url

      // console.log(infos)

      // console.log(data.product.ingredients_text_debug)
      // console.log(data.product.product_name_fr)
      // console.log(data.product.image_url)

      // searchProducts(barcode)

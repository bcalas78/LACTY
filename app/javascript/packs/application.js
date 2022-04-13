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
const formImg = document.querySelector("#product_image")
const form = document.querySelector("#new_product")

ScanditSDK.configure("AbZxahTjNbmiADJfSyuZ2iUaZRoeKa4GGl3V67g5g3qRfmyRxCI6gjwUiwAXXnbPDE52OoN9LVq8Jbm213B6/ycNQ6vbRLIllV3Ejnh2ncp/BhEbNh9i/Rdj7j6jWSJ9kHcxh1p+8Y0CbkxPpihcgd9tAMEzAgLD523fd54zJEizaUbi7SfyEUUBeFvDIkOIHxkPAGwlHUQEbWZN82eZrHNswjyaWv/5usfQsX/hn0mCmMFNMXKvlN59uOv0mUWMQGdxPa7Oqkp2fVgUa9HsQFQbApn6OGbObXi2mB9MCKCRiWpF9wr2tWhbWeIsJ7S/Z9hxcHr/SvVwFJbGt3pGBfQSLUng5TPMjtk30Aa17EwGWrr/Zt4CGymmcMOcbn8huf+nJnbB2w3oUR0vyYIz0eCrQNhuXwKm+jk//a5F9Yx4FP1cw7yBQ2YQdhWh75j44APB8kqgMLCXzVibKexmKKF6e6xikYf+FCLBy4s0eY0hHK3YJEqBxqYLkGcRImIOpHYnPH3NmSoxYmuAUhMC1dJzq7zi7G9plYwlK8okpTHnHLaj0Uck0QJ49CiANev0MFNJihil+j3hAJ2IHRMRtX/loN0ddObGHlBrN49pXlEVqV6e8i4g/xA5DaAoH6jrMxaAKlr6rEj2MM993shqlDjyPBFe95OGn6MHixBTfDDhE3WegT83a0pN4t7/DPAkc6QNpMQt6+1VOCIkRjYDDHIQHzTCruyRLpj3CjqBEg0UPg5Y3do8Gw4jGBbtJT6D7300BD4cIt0n8ruGxNXRaHTOBUDLOb/7MfSpPPSIyGR18FhbsZDudpiSbY38vjH85G9cdeuV9E8es7w8z99RSaP0DVFQnorWSEi/H0C+FthNBbLRhy+kCFr7jiGD12WWjMSeUUJ8gg==", {
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
          formCompo.value = data.product.ingredients_text_fr
          formImg.value = data.product.image_url
        })
      }
      // console.log(form)

      // console.log(infos)

      // console.log(data.product.ingredients_text_debug)
      // console.log(data.product.product_name_fr)
      // console.log(data.product.image_url)

      // searchProducts(barcode)

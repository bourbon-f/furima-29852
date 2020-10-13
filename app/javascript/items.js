window.addEventListener("load", function(){
  const price = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener("keyup", function(){
    const value = price.value
    
    const tax = Math.floor(value * 0.1)
    const profitPrice = value - tax

    fee.innerHTML = tax
    profit.innerHTML = profitPrice
  })
})
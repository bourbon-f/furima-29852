const pay = ()=> {
  Payjp.setPublicKey("pk_test_d876311fee9800a2fca64ef9");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
      e.preventDefault();
    
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);
      console.log(formData)
      const card = {
        number: formData.get("order_form[number]"),
        cvc: formData.get("order_form[cvc]"),
        exp_month: formData.get("order_form[exp_month]"),
        exp_year: `20${formData.get("order_form[exp_year]")}`,
      };
console.log(card)
      Payjp.createToken(card, (status, response) => {
        debugger
        if (status == 200) {
          const token = response.id;
          console.log(token)
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} type="hidden" name='token'>`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      })
  })
}

window.addEventListener("load", pay);
function prices () {
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", (e) => {
    const price = parseFloat(priceInput.value);
    if (!isNaN(price)) {
      const fee = Math.floor(price * 0.1);
      const profitValue = Math.floor(price - fee);

      taxPrice.textContent = fee;
      profit.textContent = profitValue;
    } else {
      taxPrice.textContent = "0"
      profit.textContent = "0"
    };
  });
};


window.addEventListener("load", prices);
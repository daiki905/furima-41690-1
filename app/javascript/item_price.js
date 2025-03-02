const priceInput = document.getElementById("item-price");

function calculateFees() {
  const inputValue = parseFloat(priceInput.value);

  if (!isNaN(inputValue)) {
    const feeRate = 0.10;
    const fee = inputValue * feeRate;
    const flooredFee = Math.floor(fee);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.textContent = `${flooredFee}`;

    const prom = inputValue - flooredFee;
    const flooredProm = Math.floor(prom);
    const profitDom = document.getElementById("profit");
    profitDom.textContent = `${flooredProm}`;
  }
}

priceInput.addEventListener("input", calculateFees);

window.addEventListener("turbo:load", calculateFees);
window.addEventListener("turbo:render", calculateFees);
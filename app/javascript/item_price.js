// const priceInput = document.getElementById("item-price");

// function calculateFees() {
//   const inputValue = parseFloat(priceInput.value);

//   if (!isNaN(inputValue)) {
//     const feeRate = 0.10;
//     const fee = Math.floor(inputValue * feeRate);
//     const flooredFee = Math.floor(fee);
//     const addTaxDom = document.getElementById("add-tax-price");
//     addTaxDom.textContent = `${flooredFee}`;

//     const prom = inputValue - flooredFee;
//     const flooredProm = Math.floor(prom);
//     const profitDom = document.getElementById("profit");
//     profitDom.textContent = `${flooredProm}`;
//   }
// }

// priceInput.addEventListener("input", calculateFees);

// window.addEventListener("turbo:load", calculateFees);
// window.addEventListener("turbo:render", calculateFees);

const price = () => {
  // 価格
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    // 販売手数料 (10%)実装
    const taxRate = 0.1;
    const taxPrice = Math.floor(inputValue * taxRate);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${taxPrice}`;
    // 販売利益
    const profit = document.getElementById("profit");
    const profitValue = Math.floor(inputValue - taxPrice);
    profit.innerHTML = `${profitValue}`;
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
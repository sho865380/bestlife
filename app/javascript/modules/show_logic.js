document.addEventListener("DOMContentLoaded", function () {
    // 今日の日付を取得
    let today = new Date();
    let formattedDate = `${today.getFullYear()}年${
      today.getMonth() + 1
    }月${today.getDate()}日`;
  
    // 日付をヘッダーにセット
    document.getElementById("currentDate").textContent = formattedDate;

    const selectField = document.getElementById("durationSelect");
    const csrfToken = document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute("content");
    let muscleMassChart2;
    let bodyPercentageChart;
    
    const selectedValue = selectField.value;
    let url = "http://localhost:3000/users/set_duration";

    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "X-CSRF-Token": csrfToken, // CSRFトークンをヘッダーに追加
      },
      body: `duration=${selectedValue}&date=${formattedDate}`, // リクエストボディにパラメータをセット
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
      })
      .then((jsonData) => {
        let muscleMassCtx2 = document
          .getElementById("muscleMassChart")
          .getContext("2d");

        muscleMassChart2 = new Chart(muscleMassCtx2, {
          type: "line",
          data: jsonData,

          options: {
            scales: {
              y: {
                beginAtZero: true,
              },
            },
          },
        });
      
      
      })
      .catch((error) => {
        console.error("Fetch error:", error);
      });
    
    selectField.addEventListener("change", (e) => {
      const selectedValue = selectField.value;
      const url = "http://localhost:3000/users/set_duration";
  
      fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "X-CSRF-Token": csrfToken, // CSRFトークンをヘッダーに追加
        },
        body: `duration=${selectedValue}&date=${formattedDate}`, // リクエストボディにパラメータをセット
      })
        .then((response) => {
          if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
      })
      .then((jsonData) => {
        muscleMassChart2.data = jsonData;
        muscleMassChart2.update();
        
      })
      .catch((error) => {
        console.error("Fetch error:", error);
        });
    });


    url = "http://localhost:3000/users/set_duration2";

    fetch(url, {
  method: "POST",
  headers: {
    "Content-Type": "application/x-www-form-urlencoded",
    "X-CSRF-Token": csrfToken, // CSRFトークンをヘッダーに追加
  },
  body: `duration=${selectedValue}&date=${formattedDate}`, // リクエストボディにパラメータをセット
})
  .then((response) => {
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
  }
  return response.json();
})
.then((jsonData) => {
  let bodyPercentageCtx2 = document
    .getElementById("bodyPercentageChart")
    .getContext("2d");
   bodyPercentageChart = new Chart(bodyPercentageCtx2, {
    type: "line",
    data: jsonData,

    options: {
      scales: {
        y: {
          beginAtZero: true,
        },
      },
    },
  });
})
.catch((error) => {
  console.error("Fetch error:", error);
});




  
    selectField.addEventListener("change", (e) => {
      const selectedValue = selectField.value;
      const url = "http://localhost:3000/users/set_duration2";
  
      fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "X-CSRF-Token": csrfToken,
        },
        body: `duration=${selectedValue}&date=${formattedDate}`,
      })
        .then((response) => {
          if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
  })
  .then((jsonData) => {
    debugger;
    bodyPercentageChart.data = jsonData;
    bodyPercentageChart.update();
  })
  .catch((error) => {
    console.error("Fetch error:", error);
  });
});

});
  
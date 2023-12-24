// document.addEventListener("DOMContentLoaded", function () {
//     // 今日の日付を取得
//     let today = new Date();
//     let formattedDate = `${today.getFullYear()}年${
//       today.getMonth() + 1
//     }月${today.getDate()}日`;
  
//     // 日付をヘッダーにセット
//     document.getElementById("currentDate").textContent = formattedDate;

//     const selectField = document.getElementById("durationSelect");
//     const csrfToken = document
//       .querySelector('meta[name="csrf-token"]')
//       .getAttribute("content");
//     let muscleMassChart2;
//     let bodyPercentageChart;
//     let weightChart;
    
//     const selectedValue = selectField.value;
//     let url = "http://localhost:3000/users/set_duration";

//     fetch(url, {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/x-www-form-urlencoded",
//         "X-CSRF-Token": csrfToken, // CSRFトークンをヘッダーに追加
//       },
//       body: `duration=${selectedValue}&date=${formattedDate}`, // リクエストボディにパラメータをセット
//     })
//       .then((response) => {
//         if (!response.ok) {
//           throw new Error(`HTTP error! Status: ${response.status}`);
//       }
//       return response.json();
//       })
//       .then((jsonData) => {
//         let muscleMassCtx2 = document
//           .getElementById("muscleMassChart")
//           .getContext("2d");

//         muscleMassChart2 = new Chart(muscleMassCtx2, {
//           type: "line",
//           data: jsonData,

//           options: {
//             scales: {
//               y: {
//                 beginAtZero: true,
//               },
//             },
//           },
//         });
      
      
//       })
//       .catch((error) => {
//         console.error("Fetch error:", error);
//       });
    
//     selectField.addEventListener("change", (e) => {
//       const selectedValue = selectField.value;
//       const url = "http://localhost:3000/users/set_duration";
  
//       fetch(url, {
//         method: "POST",
//         headers: {
//           "Content-Type": "application/x-www-form-urlencoded",
//           "X-CSRF-Token": csrfToken, // CSRFトークンをヘッダーに追加
//         },
//         body: `duration=${selectedValue}&date=${formattedDate}`, // リクエストボディにパラメータをセット
//       })
//         .then((response) => {
//           if (!response.ok) {
//           throw new Error(`HTTP error! Status: ${response.status}`);
//         }
//         return response.json();
//       })
//       .then((jsonData) => {
//         muscleMassChart2.data = jsonData;
//         muscleMassChart2.update();
        
//       })
//       .catch((error) => {
//         console.error("Fetch error:", error);
//         });
//     });


//     url = "http://localhost:3000/users/set_duration2";

//     fetch(url, {
//   method: "POST",
//   headers: {
//     "Content-Type": "application/x-www-form-urlencoded",
//     "X-CSRF-Token": csrfToken, // CSRFトークンをヘッダーに追加
//   },
//   body: `duration=${selectedValue}&date=${formattedDate}`, // リクエストボディにパラメータをセット
// })
//   .then((response) => {
//     if (!response.ok) {
//       throw new Error(`HTTP error! Status: ${response.status}`);
//   }
//   return response.json();
// })
// .then((jsonData) => {
//   let bodyPercentageCtx2 = document
//     .getElementById("bodyPercentageChart")
//     .getContext("2d");
//    bodyPercentageChart = new Chart(bodyPercentageCtx2, {
//     type: "line",
//     data: jsonData,

//     options: {
//       scales: {
//         y: {
//           beginAtZero: true,
//         },
//       },
//     },
//   });
// })
// .catch((error) => {
//   console.error("Fetch error:", error);
// });




  
//     selectField.addEventListener("change", (e) => {
//       const selectedValue = selectField.value;
//       const url = "http://localhost:3000/users/set_duration2";
  
//       fetch(url, {
//         method: "POST",
//         headers: {
//           "Content-Type": "application/x-www-form-urlencoded",
//           "X-CSRF-Token": csrfToken,
//         },
//         body: `duration=${selectedValue}&date=${formattedDate}`,
//       })
//         .then((response) => {
//           if (!response.ok) {
//           throw new Error(`HTTP error! Status: ${response.status}`);
//       }
//       return response.json();
//   })
//   .then((jsonData) => {
//     debugger;
//     bodyPercentageChart.data = jsonData;
//     bodyPercentageChart.update();
//   })
//   .catch((error) => {
//     console.error("Fetch error:", error);
//   });
// });



// url = "http://localhost:3000/users/set_duration3";

// fetch(url, {
// method: "POST",
// headers: {
// "Content-Type": "application/x-www-form-urlencoded",
// "X-CSRF-Token": csrfToken, // CSRFトークンをヘッダーに追加
// },
// body: `duration=${selectedValue}&date=${formattedDate}`, // リクエストボディにパラメータをセット
// })
// .then((response) => {
// if (!response.ok) {
//   throw new Error(`HTTP error! Status: ${response.status}`);
// }
// return response.json();
// })
// .then((jsonData) => {
// let weightCtx2 = document
// .getElementById("weightChart")
// .getContext("2d");
// weightChart = new Chart(weightCtx2, {
// type: "line",
// data: jsonData,

// options: {
//   scales: {
//     y: {
//       beginAtZero: true,
//     },
//   },
// },
// });
// })
// .catch((error) => {
// console.error("Fetch error:", error);
// });





// selectField.addEventListener("change", (e) => {
//   const selectedValue = selectField.value;
//   const url = "http://localhost:3000/users/set_duration3";

//   fetch(url, {
//     method: "POST",
//     headers: {
//       "Content-Type": "application/x-www-form-urlencoded",
//       "X-CSRF-Token": csrfToken,
//     },
//     body: `duration=${selectedValue}&date=${formattedDate}`,
//   })
//     .then((response) => {
//       if (!response.ok) {
//       throw new Error(`HTTP error! Status: ${response.status}`);
//   }
//   return response.json();
// })
// .then((jsonData) => {
// debugger;
// weightChart.data = jsonData;
// weightChart.update();
// })
// .catch((error) => {
// console.error("Fetch error:", error);
// });
// });

// });
document.addEventListener("DOMContentLoaded", function () {
  const today = new Date();
  const formattedDate = `${today.getFullYear()}年${today.getMonth() + 1}月${today.getDate()}日`;
  document.getElementById("currentDate").textContent = formattedDate;
   
  // 下記コードはアイコンをクリックした際の遷移ページ
  const calendarIcon = document.getElementById('calendarIcon');
  if (calendarIcon) {
    calendarIcon.addEventListener('click', function() {
      window.location.href = '/users/calendar';
    });
  }

  const selectField = document.getElementById("durationSelect");
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
  let charts = {
      muscleMassChart: null,
      bodyPercentageChart: null,
      weightChart: null
  };

  function fetchDataAndRenderChart(chartId, url, chartType) {
      const selectedValue = selectField.value;
      fetch(url, {
          method: "POST",
          headers: {
              "Content-Type": "application/x-www-form-urlencoded",
              "X-CSRF-Token": csrfToken,
          },
          body: `duration=${selectedValue}&date=${formattedDate}`,
      })
      .then(response => {
          if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
          return response.json();
      })
      .then(jsonData => {
          const ctx = document.getElementById(chartId).getContext("2d");
          if (charts[chartType]) {
              charts[chartType].data = jsonData;
              charts[chartType].update();
          } else {
              charts[chartType] = new Chart(ctx, {
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
          }
      })
      .catch(error => console.error("Fetch error:", error));
  }

  selectField.addEventListener("change", () => {
      fetchDataAndRenderChart("muscleMassChart", "/users/set_duration", "muscleMassChart");
      fetchDataAndRenderChart("bodyPercentageChart", "/users/set_duration2", "bodyPercentageChart");
      fetchDataAndRenderChart("weightChart", "/users/set_duration3", "weightChart");
  });

  // 初期チャートのロード
  selectField.dispatchEvent(new Event("change"));
});


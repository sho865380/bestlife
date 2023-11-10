document.addEventListener("DOMContentLoaded", function() {
    // 今日の日付を取得
    let today = new Date();
    let formattedDate = `${today.getFullYear()}年${today.getMonth() + 1}月${today.getDate()}日`;

    // 日付をヘッダーにセット
    document.getElementById("currentDate").textContent = formattedDate;

    Chart.jsでのグラフ作成コード
let ctx = document.getElementById('bodyPercentageChart').getContext('2d');
let bodyPercentageChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['1月', '2月', '3月', '4月', '5月'],  // 月を例としています。必要に応じて変更してください。
        datasets: [{
            label: '現状',
            data: [14.2, 13.5, 12.8, 12.5, 12.2],  // 実際のデータに置き換えてください。
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 2,
            fill: false
        },
        {
            label: '目標',
            data: [14.0, 13.0, 12.0, 11.0, 10.0],  // 実際のデータに置き換えてください。
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 2,
            fill: false
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
 });

 const selectField = document.getElementById('durationSelect');
const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

let bodyPercentageChart2; // チャートのインスタンスを保持するための変数をグローバルスコープで宣言

selectField.addEventListener('change', (e) => {
  const selectedValue = selectField.value;
  const url = "http://localhost:3000/users/set_duration2";

  fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'X-CSRF-Token': csrfToken
    },
    body: `duration=${selectedValue}&date=${formattedDate}`
  })
  .then(response => {
      if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
  })
  .then(jsonData => {
      if (bodyPercentageChart2) {
          bodyPercentageChart2.destroy(); // 既存のチャートを破棄
      }
      let bodyPercentageCtx2 = document.getElementById('bodyPercentageChart').getContext('2d');
      bodyPercentageChart2 = new Chart(bodyPercentageCtx2, {
        type: 'line',
        data: jsonData,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
      });
  })
  .catch(error => {
      console.error('Fetch error:', error);
  });
});




 let weightCtx = document.getElementById('weightChart').getContext('2d');
let weightChart = new Chart(weightCtx, {
    type: 'line',
    data: {
        // 例として、時間や日付などのラベルを設定します。このラベルは変更することができます。
        labels: ['1月', '2月', '3月', '4月', '5月'],  
        datasets: [{
            label: '現状',
            data: [71.2, 71.5, 71.8, 72.0, 72.2],  // こちらのデータも実際の数値に合わせて変更してください。
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 2,
            fill: false
        },
        {
            label: '目標',
            data: [77.0, 76.8, 76.5, 76.3, 76.0],  // こちらのデータも実際の数値に合わせて変更してください。
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 2,
            fill: false
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
 });



// セレクトフィールドの要素を取得
// const selectField = document.getElementById('durationSelect');

// // CSRFトークンの取得
// const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

// セレクトフィールドの値が変更されたときのイベントハンドラーを追加
selectField.addEventListener('change', (e) => {
  const selectedValue = selectField.value;
  const url = "http://localhost:3000/users/set_duration";
  
  fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'X-CSRF-Token': csrfToken  // CSRFトークンをヘッダーに追加
    },
    body: `duration=${selectedValue}&date=${formattedDate}`, // リクエストボディにパラメータをセット
  })
  .then((response) => {
      if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
      }
  return response.json();
  })
  .then(jsonData => {
      let muscleMassCtx2 = document.getElementById('muscleMassChart').getContext('2d');
      let muscleMassChart2 = new Chart(muscleMassCtx2, {
    type: 'line',
    data: jsonData
        
    ,
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

  })
  .catch(error => {
      console.error('Fetch error:', error);
  });
});


});
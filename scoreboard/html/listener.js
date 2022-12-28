$(function(){
	board = "";
	$("html").hide();
	window.onload = (e) => {
        /* 'links' the js with the Nui message from main.lua */
		window.addEventListener('message', (event) => {
            //document.querySelector("#logo").innerHTML = " "
			var item = event.data;
			if (item !== undefined && item.type === "ui") {
                /* if the display is true, it will show */
				if (item.display === true) {
                    $("html").show();
					document.getElementById('sbTitle').innerHTML = item.titleTxt;
					document.getElementById('container').style.color = item.sbDefault;
					document.getElementById('playerAm').innerHTML = board.length;

					table = "";
					amPD = 0;
					amFire = 0;
					amCiv = 0;

					for(let i = 0; i < board.length; i++) {
						userID = JSON.stringify(board[i].id);
						userName = JSON.stringify(board[i].name);

						if(item.doDept === true) {
							userDept = JSON.stringify(board[i].dept);
							if(userDept === '"pd"') {
								userDept = "<div style='color:" + item.pdColour + "'>Police</div>";
								amPD = amPD + 1;
							} else if(userDept === '"fire"') {
								userDept = "<div style='color:" + item.fireColour + "'>Fire</div>";
								amFire = amFire + 1;
							} else if(userDept === '"civ"') {
								userDept = "<div style='color:" + item.civColour + "'>Civilian</div>";
								amCiv = amCiv + 1;
							} 

							table += "[" + userID + '] ' + userDept + ' | ' + userName.slice(1, -1) + '<br>';
						} else if(item.doDept === false) {
							table += "[" + userID + '] ' + userName.slice(1, -1) + '<br>';
						}
					}

					if(item.doDept === true) {
						document.getElementById('table').innerHTML = table + '<br>Civ: ' + amCiv + '<br>FD: ' + amFire + '<br>PD: ' + amPD;
					} else if(item.doDept === false) {
						document.getElementById('table').innerHTML = table;
					}
					

				} else{
                    $("html").hide();
                }
			}

			if (item !== undefined && item.type === "update") {
				board = item.sendBoard;
				// console.log(JSON.stringify(board))
			}
		});
	};
});
const req = new XMLHttpRequest();


function makeAChart(dates,prices,devise){
    
    console.log(dates[1]+prices[1]);
    
    var ctx = document.getElementById("chart").getContext('2d');
    ctx.canvas.width = 300;
    ctx.canvas.height = 100;
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: dates,
            datasets: [{
                label: 'Price of BTC in '+devise,
                data: prices,
                 lineTension: 0.3,
                backgroundColor: "rgba(255,153,0,0.5)",
                borderColor: "rgba(126,99,72,1)",
                pointRadius: 5,
                pointBackgroundColor: "rgba(126,99,72,1)",
                pointBorderColor: "rgba(255,255,255,0.8)",
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                pointHitRadius: 20,
                pointBorderWidth: 2,
            }]
        }    
    });
  
}




function setChart(){
    
    var apiUrl = "https://api.coindesk.com/v1/bpi/historical/close.json?index=EUR&currency=MONNAIE&start=DATEDEBUT&end=DATEFIN";
    
    var dateDebut = document.formulaire.debut.value;
    var dateFin = document.formulaire.fin.value; 
    var monnaie = document.formulaire.monselect.value;
    
    if (typeof dateDebut === "" || dateFin === "") {
        alert("Les dates n'ont pas été saisies correctement.");
        return null;
    }
    
    var query = apiUrl.replace("DATEDEBUT",dateDebut);
    var query = query.replace("DATEFIN",dateFin);
    var query = query.replace("MONNAIE",monnaie);
    
    today = new Date(dateDebut);
    tomorrow = new Date;
    
    req.open('GET', query, false); 
    req.send(null);
    
    if (req.status === 200) {
        console.log("Réponse reçue: %s", req.responseText);
    }   
    else {
        console.log("Status de la réponse: %d (%s)", req.status, req.statusText);
    }
    var data = JSON.parse(req.responseText);
    
    
    var array = new Array();
    var array2 = new Array();
    
    for(var price in data.bpi){
        array.push(data.bpi[price]);
    }
    
    
    var a;
    var b = new String();
    for(var date in data.bpi){
        today.setDate(today.getDate()+1);
        a=today;
        b= today.toString();
        console.log("///"+ a + "///");
        console.log("///"+ b + "///");
        array2.push(b.slice(3,15));
    }
    
    makeAChart(array2,array,monnaie);

}

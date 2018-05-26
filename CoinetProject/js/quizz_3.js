function submit(){
    
    
    
    
var answer1 = $('input[id=answer1]:checked').val() ;
var answer2 = $('input[id=answer2]:checked').val() ;
var answer3 = $('input[id=answer3]:checked').val() ;
var answer4 = $('input[id=answer4]:checked').val() ;
var answer5 = $('input[id=answer5]:checked').val() ;
var answer6 = $('input[id=answer6]:checked').val() ;
var answer7 = $('input[id=answer7]:checked').val() ;
var answer8 = $('input[id=answer8]:checked').val() ;
var answer9 = $('input[id=answer9]:checked').val() ;
var answer10 = $('input[id=answer10]:checked').val() ;
var answer11 = $('input[id=answer11]:checked').val() ;
var answer12 = $('input[id=answer12]:checked').val() ;
var answer13 = $('input[id=answer13]:checked').val() ;
var answer14 = $('input[id=answer14]:checked').val() ;
var answer15 = $('input[id=answer15]:checked').val() ;
var answer16 = $('input[id=answer16]:checked').val() ;
var answer17 = $('input[id=answer17]:checked').val() ;
var answer18 = $('input[id=answer18]:checked').val() ;
    
    var tab = new Array(0, 0);
    
    if(answer1 == "on"){
        tab[1] = tab[1]+1;
    }
    else{
        tab[0] = tab[0]+1;
    }
    
    if(answer4 == "on"){
        tab[1] = tab[1]+1;
    }
    else{
        tab[0] = tab[0]+1;
    }
    
    if(answer8 == "on"){
        tab[1] = tab[1]+1;
    }
    else{
        tab[0] = tab[0]+1;
    }
    
    if(answer10 == "on"){
        tab[1] = tab[1]+1;
    }
    else{
        tab[0] = tab[0]+1;
    }
    
    if(answer15 == "on"){
        tab[1] = tab[1]+1;
    }
    else{
        tab[0] = tab[0]+1;
    }
    
    if(answer18 == "on"){
        tab[1] = tab[1]+1;
    }
    else{
        tab[0] = tab[0]+1;
    }
    
    makeAChart(tab);
    
}



function makeAChart(tab){
    
    
    
    reset_canvas();
    
    var ctx = document.getElementById("myPieChart").getContext('2d');
    ctx.canvas.width = 400;
    ctx.canvas.height = 400;
    
    var myPieChart = new Chart(ctx,{
        type: 'pie',
        data: {
            labels: ["wrong answer", "good answer"],
            datasets: [{
                label: 'your mark',
                data: tab,
                 lineTension: 0.3,
                backgroundColor: ["rgba(255,153,0,1)","rgba(84,132,242,1)"],
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

function reset_canvas(){
    
    $("#myPieChart").remove();
    $("#chart_container").append('<canvas id="myPieChart" width="100%" height="30"></canvas>');
    
}



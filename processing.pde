let aaa;
let st;
let palettes = [];
function preload() {
}
function setup() {
    createCanvas(windowWidth, windowHeight-10);
    //background(100,100,100);
   mapBack()
   aaa =createVector(0,0);
   st=1;
   palettes.push(new palette(50,50,false,"A1","https://antoineadam.fr",false,false,"testDeDons",50));
   palettes.push(new palette(50,150,true,"A2","https://antoineadam.fr",false,false,"testDeDons",51));
   palettes.push(new palette(50,250,true,"A3","https://antoineadam.fr",false,false,"testDeDons",52));
   palettes.push(new palette(840,430,false,"C5","https://antoineadam.fr",false,false,"testDeDons",53));
   palettes.push(new palette(840,530,true,"C6","https://antoineadam.fr",false,false,"testDeDons",54));
   palettes.push(new palette(840,630,false,"C7","https://antoineadam.fr",false,true,"testDeDons",55));
   palettes.push(new palette(840,730,true,"C8","https://antoineadam.fr",false,false,"testDeDons",56));
}
function paletteDraw(value,rot){
    let deltaX=value.x;
    let deltaY=value.y;
    strokeCap(SQUARE);
    strokeWeight(8);
    stroke("#C98F1C");
    line(0+deltaX,0+deltaY,0+deltaX,50+deltaY);
    line(38+deltaX,0+deltaY,38+deltaX,50+deltaY);
    line(75+deltaX,0+deltaY,75+deltaX,50+deltaY);
    strokeWeight(10);
    stroke("#E69B32");
    line(-4+deltaX,0+deltaY,79+deltaX,0+deltaY);
    line(-4+deltaX,25+deltaY,79+deltaX,25+deltaY);
    line(-4+deltaX,50+deltaY,79+deltaX,50+deltaY);
    strokeWeight(7);
    line(-4+deltaX,13+deltaY,79+deltaX,13+deltaY);
    line(-4+deltaX,38+deltaY,79+deltaX,38+deltaY);
    strokeCap(ROUND);
}
function mapBack(){
    //var pilier
    let a1=1090;
    let a2=1425;
    let a3=1725;
    let b1=750;
    let b2=1125;
    let b3=1500;
    let b4=1875;
    let b5=2250;
    let b6=2625;
    let b7=3000;
    //poutre
    strokeWeight(10);
    stroke(112, 215, 220);
    line(800,b1,1425,b1);
    line(800,b2,1425,b2);
    line(800,b3,1425,b3);
    line(800,b4,2050,b4);
    line(800,b5,2050,b5);
    line(800,b6,2050,b6);
    line(800,b7,2050,b7);
    //mur externe
    stroke('rgb(0%,0%,0%)');
    strokeWeight(20);
    line(0,0,250,0);
    line(0,0,0,400);
    line(0,400,800,400);
    line(800,400,800,3340);
    line(800,3340,2050,3340);
    line(2050,3340,2050,0);
    line(0,0,2050,0);
    //mur interne
    strokeWeight(10);
    line(800,400,2050,400);
    line(1425,400,1425,1500);
    line(1425,1500,2050,1500);
    line(1545,1310,2050,1310);
    line(1545,1310,1545,400);
    line(1545,1125,2050,1125);
    line(1545,940,2050,940);
    line(1730,0,1730,400);
    line(1730,235,2050,235);
    line(2050,310,1900,310);
    line(1900,235,1900,400);
    line(1545,1310,1425,1310);
    //porte
    stroke(163, 1, 255);
    strokeWeight(20);
    line(1450,0,1500,0);
    strokeWeight(10);
    line(1730,150,1730,200);
    line(1730,325,1730,375);
    line(1900,250,1900,300);
    line(1900,370,1900,320);
    line(1545,530,1545,580);
    line(1545,825,1545,875);
    line(1545,1000,1545,1100);
    line(1545,1175,1545,1275);
    line(1535,1310,1435,1310);
    line(1425,520,1425,600);
    //autre
    stroke(5, 166, 49);
    strokeWeight(100);
    point(1955,2915);
    //pilier
    stroke(106, 144, 189);
    strokeWeight(20);
    point(a1,b1);
    point(a1,b2);
    point(a2,b1);
    point(a2,b2);
    [a1,a2,a3].forEach(function(aa){
        [b3,b4,b5,b6,b7].forEach(function(ab){
            point(aa, ab);
        });
    }); 
}
class palette{
    constructor(x,y,isEmpty,name,lien,rot,isTraker,nameGroupe,idPalette){
        this.position=createVector(x,y),
        this.isEmpty=isEmpty;
        this.name=name;
        this.lien=lien;
        this.rot=rot;
        this.nameGroupe=nameGroupe;
        this.idPalette=idPalette;
        this.isTraker=isTraker;
        this.isClic=false;
        if(this.isTraker == undefined)this.isTraker=false;
        if(this.rot == undefined)this.rot=false;
    }
    draw(){
        let width;
        let height;
        if(this.rot){
            width=70;
            height=95;
        }else{
            width=95;
            height=70;
        }
        strokeWeight(2);
        if(this.isEmpty){
            stroke("#3493B3");
            fill("#3BA2EB");
        }else{
            stroke("#46C75B");
            fill("#51E86A");
        }
        if(this.isTraker){
            if(second()%2 == 0){
                stroke("#F82731");
            }
        }
        rect(this.position.x, this.position.y, width, height);
        let ppp = this.position.copy();
        ppp.add(10,10);
        if(!this.isEmpty)paletteDraw(ppp,this.rot);
        if(this.rot)ppp.add(25,38);else ppp.add(38,25);
        noStroke();
        fill("#FF0046");
        textAlign(CENTER,CENTER);
        textSize(30);
        text(this.name,ppp.x,ppp.y);
    }
    info(){
        let popx= (mouseX-aaa.x)/st;
        let popy=(mouseY-aaa.y)/st;
        text("x: "+popx+" y: "+popy,popx,popy);
        if(popx <this.position.x+95 && popx > this.position.y && popy <this.position.y+70 && popy > this.position.y){
            stroke("#26241F");
            strokeWeight(1/st);
            fill("#BDBFBA");
            rect(popx, popy+20/st, 400/st, 70/st);
            
            noStroke();
            textSize(15/st);
            fill("#40007F");
            textAlign(LEFT,CENTER);
            text("Emplacement:",popx+20/st,40/st+popy);
            fill("#FFFF00");
            text(this.name,popx+200/st,40/st+popy);
            fill("#40007F");
            text("Contenence:",popx+20/st,60/st+popy);
            if(this.isEmpty){
                fill("#E63631");
                text("Vide",popx+120/st,60/st+popy);
            }else{
                fill("#3A51E6");
                text("Palette n°"+this.idPalette+" issu du dons "+this.nameGroupe,popx+120/st,60/st+popy);
            }
            //textAlign(CENTER,CENTER);
            fill("#8000FF");
            text("Clique sur la palette pour plus d'information.",popx+60/st,80/st+popy);
            if(mouseIsPressed){
                if(!this.isClic){
                    this.isClic=true;
                    window.location = this.lien;
                }
            }else{
                this.isClic=false;
            }
        }
    }
}
function mouseWheel(event) {
  if(event.delta>0){
      st*=0.80;
  }else{
      st*=1.5;
  }
}
function draw(){ 
    if(mouseIsPressed){
        aaa.add(mouseX-pmouseX,mouseY-pmouseY);
    }
    
    translate(aaa);
    scale(st);
    background(255, 255, 255);
    mapBack();
    palettes.forEach(function(value){
        value.draw();
        value.info();
    });
    //text("x: "+mouseX+" y: "+mouseY+" s: "+second()%2, 20, 20);
    //pelette(createVector(1955,2915));
}
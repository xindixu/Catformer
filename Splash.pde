class Splash{
  ArrayList <Particle> particles;
  PVector origin;
  int numdrops;
  
  //constructor
  Splash(int splashSize, PVector loc){
   numdrops = splashSize; 
   origin = loc.copy();
   particles =new ArrayList();
   for (int i =0; i < numdrops; i ++){
     particles.add(new Particle(origin));
   }
  }
  void run(){
    for (int i = particles.size() -1; i >=0; i--){
      Particle p = particles.get(i);
      p.run();
      if (p.isOff()){
        particles.remove(i);
      }
    }
  }
}
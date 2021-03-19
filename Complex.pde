class ComplexNum{
  float[] number = new float[2];
  float UPPER_LIMIT = 1e10;
  float LOWER_LIMIT = 1e-5;
  
  ComplexNum(float r, float i){
    number[0] = r;
    number[1] = i;
  }
  
  void squared() {
    float real = pow(this.number[0], 2) - pow(number[1], 2);
    float im = 2*number[0]*number[1];
    number[0] = real;
    number[1] = im;
  }
  
  void printNum(){
    println(number[0] + " + " + number[1] + "i");  
  }
  
  void add(float[] z){
    number[0] += z[0];
    number[1] += z[1];
  }
  
  boolean hasConverged(){
      if(abs(number[0]) <= LOWER_LIMIT || abs(number[1]) <= LOWER_LIMIT){
        return true;  
      }else {
        return false;  
      }
  }
  
  boolean hasDiverged(){
      if(abs(number[0]) >= UPPER_LIMIT || abs(number[1]) >= UPPER_LIMIT){
        return true;  
      }else {
        return false;  
      }
  }
}

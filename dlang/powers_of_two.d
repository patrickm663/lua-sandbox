import std.stdio;
import std.math;
import std.array;
import std.algorithm;
import std.bigint;
import std.conv;

void main(){
				int a = 2;
				int b = 100;
				float[] arr = [];
				for(int i=a; i<=b; i++){
								for(int j=a; j<=b; j++){
												arr ~= j*log(i);
								}
				}
				//arr.sort.writeln;
				count_unique(arr).writeln;
}

int count_unique(float[] t) {
				int count = 1;
				t.sort;
				for(int i=0; i<(t.length-1); i++){
								if(t[i] != t[i+1]){
												count++;
								}
				}	
				return(count);
}

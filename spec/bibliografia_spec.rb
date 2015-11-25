require 'spec_helper'

describe Bibliografia do
	before :each do
	            	      
	      @p1=Bibliografia::Bibliografia.new(
					 'Dave Thomas','Programming Ruby 1.9 & 2.0','The Pragmatic Programmers’Guide(The Facets of Ruby)','Pragmatic Bookshelf','4','(2013,7,7)',['ISBN-13: 978-1937785499','ISBN-10: 1937785491'])

	      @node1 = Bibliografia::Node.new(@p1,nil)
	    
	
	      @p2=Bibliografia::Bibliografia.new(
					 'Dave Thomas', 'Pro Git 2009th Edition', '(Pro)',' Apress', '2009',' (August 27, 2009)',['ISBN-13: 978-1430218333', 'ISBN-10: 1430218339'])

	      @node2 = Bibliografia::Node.new(@p2,nil)
	      
	      
	      @p3=Bibliografia::Bibliografia.new(
					 ['David Flanagan', 'Yukihiro Matsumoto'],' The Ruby Programming Language.',' O’Reilly',' Media', '1', '(February 4, 2008)',['ISBN-10: 0596516177','ISBN-13: 978-0596516178'])    

	      @node3 = Bibliografia::Node.new(@p3,nil)
	      
	      
	      @p4=Bibliografia::Bibliografia.new(
					['David Chelimsky', 'Dave Astels', 'Bryan Helmkamp', 'Dan North', 'Zach Dennis', 'Aslak Hellesoy'], 'The RSpecBook', 'Behaviour Driven Development with RSpec', 'Cucumber, and Friends (The Facets of Ruby)Pragmatic
Bookshelf', '1','(December 25, 2010)', ['ISBN-10: 1934356379.' ,'ISBN-13: 978-1934356371'])

	      @node4 = Bibliografia::Node.new(@p4,nil)
	      
	      
	      @p5=Bibliografia::Bibliografia.new(
					 'Richard E', 'Silverman Git Pocket Guide', 'O’Reilly','Media;', '1','(August 2, 2013)',['ISBN-10: 1449325866.','ISBN-13: 978-1449325862.'])

	      @node5 = Bibliografia::Node.new(@p5,nil)

	
			
  end
	context"Pruebas para bibliografia"do
		it "Comprueba que el numero de edicion p1 sea mayor que el de  p4" do
			expect(@p1.numeroedicion > @p4.numeroedicion).to eq(true)
	    	end
		it "Comprueba que el numero de edicion p5 sea menor que el de  p1" do
			expect(@p5.numeroedicion < @p1.numeroedicion).to eq(true)
	    	end			
		it "El autor 1 es igual al autor 2" do
      			expect(@p1.autores == @p2.autores).to eq(true)
    		end
		it "El autor 1 es diferente al autor 3" do
      			expect(@p1.autores == @p3.autores).to eq(false)
    		end
		
	end
end#fin del describe de bibliografia

describe Bibliografia::Lista do	  
	  before :each do
	      
	      @lista=Bibliografia::Lista.new()
	      @lista.push(@node1)
	      @lista.push(@node2)
	      @lista.push(@node3)
	      @lista.push(@node4)
	      @lista.push(@node5)
	      
           end
  
	
 	   context "Pruebas para Node" do
	       it "Debe existir un Nodo de la lista con sus datos y su siguiente" do
	         expect(@lista.cabeza != nil)
	       end
	    end
	   
	   context "Pruebas para Lista" do
	      
		it "Se deben insertar nodos en la lista" do
                    @lista.push(@node1)
                    expect(@lista.cabeza).to eq(@node1)
                end
                
                it "Se insertan varios elementos por el principio" do
                    @lista.push(@node1)
                    @lista.push(@node2)
                    expect(@lista.cabeza).to eq(@node2)
                end
		
		it "Se insertan varios elementos por el final" do
                    @lista.push_final(@node1)
                    @lista.push_final(@node2)
                    expect(@lista.cabeza).to eq(@node1)
                end

	        it "Se extrae el primer elemento de la lista" do
		    @lista.push(@node1)
                    @lista.push(@node2)
                    @lista.pop
                    expect(@lista.cabeza).to eq(@node1)	
	        end
		
		it "Se extrae el ultimo elemento de la lista" do
		    @lista.push_final(@node1)
                    @lista.push_final(@node2)
                    @lista.pop_final
                    expect(@lista.cabeza).to eq(@node1)	
	        end
		
		it "Se inserta por el final de la lista" do
		    @lista.push_final(@node1)
                    @lista.push_final(@node2)
                    expect(@lista.cabeza).to eq(@node1)	
	        end
	        context "Pruebas para lista enumerable" do
    		it "Se puede encontrar un autor" do
		    @lista.push_final(@node1)
                    @lista.push_final(@node2)
		    @lista.push_final(@node5)
		    @lista.find {|i| i == "Dave Thomas"}
		end
		it "Devuelve el minimo" do
		    @lista.push_final(@node1)
                    @lista.push_final(@node2)
		    @lista.push_final(@node5)
		    expect(@lista.min).to eq(@node5)
		end
		it "Devuelve el maximo" do
		    @lista.push_final(@node1)
                    @lista.push_final(@node2)
		    @lista.push_final(@node5)
		    expect(@lista.max).to eq(@node1)
		end
		end
	      
	
	  end 
end#fin del describe de Lista

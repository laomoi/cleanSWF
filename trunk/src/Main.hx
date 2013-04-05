package ;

import format.swf.Reader;
import format.swf.Tools;
import format.swf.Writer;
import haxe.io.Bytes;
import haxe.io.BytesInput;
import haxe.io.BytesOutput;
import haxe.io.Input;
import neko.io.FileInput;
import neko.io.FileOutput;
import neko.Lib;
import format.abc.Data;
import format.swf.Data;
import neko.Sys;
/**
 * ...
 * @author ldx, www.swfdiy.com
 */

class Main 
{


	static function main() 
	{
		
		//read args
		var args:Array<String> = Sys.args();
		if (args.length < 2) {
			Lib.println("cleanSWF [input swf] [output swf]");
			Sys.exit(1);
		}
		var input:String =  args[0] ;
		var outputFile:String = args[1];

		if (input == null) {
			input = "test.swf";
		}
		//read swf
		var fin:FileInput = neko.io.File.read(input, true);
		if (fin == null) {
			Lib.println("open file error:" + input);
			Sys.exit(1);
		}
		
		var reader:MyReader = new MyReader(fin);
		var swf:SWF = reader.read();


		//write
		var output:FileOutput = neko.io.File.write(outputFile, true);
		var writer:Writer = new Writer(output);
		writer.write(swf);
		Lib.println(outputFile + " saved");
	}
	
}

					
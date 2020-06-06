package pl.jkkk.task0;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

import java.io.IOException;

public class Map extends Mapper<LongWritable, Text, Text, IntWritable> {

    /*------------------------ FIELDS REGION ------------------------*/
    private static final IntWritable ONE = new IntWritable(1);
    private Text word = new Text();

    /*------------------------ METHODS REGION ------------------------*/
    @Override
    public void map(LongWritable key, Text value, Context context)
            throws IOException, InterruptedException {
        for (String token : value.toString().split("\\s+")) {
            word.set(token);
            context.write(word, ONE);
        }
    }
}
    
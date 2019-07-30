package com.aishang.mysbshop.controller;

import java.util.concurrent.*;
import java.util.ArrayList;
import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.Random;
import java.util.concurrent.Callable;

public class TaskCallable implements Callable<String>{
    private int s;
    Random r = new Random();
    public TaskCallable(int s){
        this.s = s;
    }

    @Override
    public String call() throws Exception {
        System.out.println(Thread.currentThread().getName() + " is working..."+s);
        //任务时快时慢
        int rint = r.nextInt(9);
        try { Thread.sleep(rint * 1000);} catch (InterruptedException e) { }
        return s+"";
    }
}


 class TestFixPool {

    public static void main(String[] args) throws Exception {
        Future<?> submit = null;
        Random random = new Random();

        //创建固定数量线程池
        ExecutorService exec = Executors.newFixedThreadPool(4);

        //用来记录各线程的返回结果
        ArrayList<Future<?>> results = new ArrayList<Future<?>>();

        for (int i = 0; i < 10; i++) {
            //每执行一次循环，提交一个任务，这个任务是Callable的，有返回结果的
            submit = exec.submit(new TaskCallable(i));
            //存储线程执行结果的引用到List中
            //线程可能还没有返回结果
            results.add(submit);
        }


        //从List中的每个引用取结果
        //取的时候一定是顺序遍历的，如果遍历到某一个Future，没有get到结果，就一直阻塞
        //等这个Future有结果了，再继续遍历下一个Future
        for(Future f: results){
            boolean done = f.isDone();
            System.out.println(done?"已完成":"未完成");  //从结果的打印顺序可以看到，即使未完成，也会阻塞等待
            System.out.println("线程返回future结果： " + f.get());
        }
        exec.shutdown();
    }
}

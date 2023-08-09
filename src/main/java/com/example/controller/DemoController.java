package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/demo")
public class DemoController {
    private final Logger LOG = LoggerFactory.getLogger(DemoController.class);

    @GetMapping("/ok")
    public void ok(){
        LOG.info("Using thread {}", Thread.currentThread().getId());
    }

    @GetMapping("/nok")
    public void demo(){
        LOG.error("Using thread {}", Thread.currentThread().getId());
    }
}

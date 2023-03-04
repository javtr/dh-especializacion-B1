package com.dh.mscourse.controller;

import com.dh.mscourse.client.ISubscriptionClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CourseController {

    @Autowired
    private ISubscriptionClient subscriptionClient;

    @GetMapping("course/find")
    public ResponseEntity<String> find() {
        return ResponseEntity.ok(subscriptionClient.find());
    }
}

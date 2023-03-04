package com.dh.mscourse.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient("ms-subscription")
public interface ISubscriptionClient {

    @GetMapping("/subscription/find")
    String find();


}


package com.pl.mailQueue.domain.model;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

@Data
@Entity
public class Mail {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "mail_id")
    private Long id;

    @NotNull
    @Email
    private String recipients;
    private String sender;
    private String title;
    private String message;
}

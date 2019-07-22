package com.pl.mailQueue.domain.model;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Data
@Entity
public class Mail {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "mail_id")
    private Long id;

    @NotNull
    private String[] recipients;
    // Nie jestem pewien jak jest adresat i nadawca po angielsku
    @Transient
    private String senderMail;

    private String message;
}

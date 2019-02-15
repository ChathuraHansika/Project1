/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Chathura
 */
@Entity
@Table(name = "payment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Payment.findAll", query = "SELECT p FROM Payment p")
    , @NamedQuery(name = "Payment.findByPid", query = "SELECT p FROM Payment p WHERE p.pid = :pid")
    , @NamedQuery(name = "Payment.findByPaymentDateTime", query = "SELECT p FROM Payment p WHERE p.paymentDateTime = :paymentDateTime")
    , @NamedQuery(name = "Payment.findByPaymentValue", query = "SELECT p FROM Payment p WHERE p.paymentValue = :paymentValue")
    , @NamedQuery(name = "Payment.findByPaymentAmount", query = "SELECT p FROM Payment p WHERE p.paymentAmount = :paymentAmount")
    , @NamedQuery(name = "Payment.findByPaymentBalance", query = "SELECT p FROM Payment p WHERE p.paymentBalance = :paymentBalance")})
public class Payment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PID")
    private Integer pid;
    @Column(name = "PaymentDateTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date paymentDateTime;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PaymentValue")
    private Double paymentValue;
    @Column(name = "PaymentAmount")
    private Double paymentAmount;
    @Column(name = "PaymentBalance")
    private Double paymentBalance;
    @JoinColumn(name = "OID", referencedColumnName = "OID")
    @ManyToOne(optional = false)
    private Orders oid;

    public Payment() {
    }

    public Payment(Integer pid) {
        this.pid = pid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Date getPaymentDateTime() {
        return paymentDateTime;
    }

    public void setPaymentDateTime(Date paymentDateTime) {
        this.paymentDateTime = paymentDateTime;
    }

    public Double getPaymentValue() {
        return paymentValue;
    }

    public void setPaymentValue(Double paymentValue) {
        this.paymentValue = paymentValue;
    }

    public Double getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(Double paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public Double getPaymentBalance() {
        return paymentBalance;
    }

    public void setPaymentBalance(Double paymentBalance) {
        this.paymentBalance = paymentBalance;
    }

    public Orders getOid() {
        return oid;
    }

    public void setOid(Orders oid) {
        this.oid = oid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (pid != null ? pid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Payment)) {
            return false;
        }
        Payment other = (Payment) object;
        if ((this.pid == null && other.pid != null) || (this.pid != null && !this.pid.equals(other.pid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.inheritor.mycompany.quickcabsservice.model.Payment[ pid=" + pid + " ]";
    }
    
}

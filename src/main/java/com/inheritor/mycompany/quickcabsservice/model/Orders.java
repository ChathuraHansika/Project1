/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Chathura
 */
@Entity
@Table(name = "orders")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o")
    , @NamedQuery(name = "Orders.findByOid", query = "SELECT o FROM Orders o WHERE o.oid = :oid")
    , @NamedQuery(name = "Orders.findByPickupDateTime", query = "SELECT o FROM Orders o WHERE o.pickupDateTime = :pickupDateTime")
    , @NamedQuery(name = "Orders.findByHandOverDateTime", query = "SELECT o FROM Orders o WHERE o.handOverDateTime = :handOverDateTime")
    , @NamedQuery(name = "Orders.findByStatus", query = "SELECT o FROM Orders o WHERE o.status = :status")
    , @NamedQuery(name = "Orders.findByOrderDate", query = "SELECT o FROM Orders o WHERE o.orderDate = :orderDate")
    , @NamedQuery(name = "Orders.findByUpateDate", query = "SELECT o FROM Orders o WHERE o.upateDate = :upateDate")})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "OID")
    private Integer oid;
    @Column(name = "PickupDateTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date pickupDateTime;
    @Column(name = "HandOverDateTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date handOverDateTime;
    @Size(max = 100)
    @Column(name = "Status")
    private String status;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Order_Date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;
    @Column(name = "Upate_Date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date upateDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "oid")
    private List<Vehiclehandover> vehiclehandoverList;
    @JoinColumn(name = "CUID", referencedColumnName = "CUID")
    @ManyToOne(optional = false)
    private Customer cuid;
    @JoinColumn(name = "CAID", referencedColumnName = "CAID")
    @ManyToOne(optional = false)
    private Car caid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "oid")
    private List<Payment> paymentList;

    public Orders() {
    }

    public Orders(Integer oid) {
        this.oid = oid;
    }

    public Orders(Integer oid, Date orderDate) {
        this.oid = oid;
        this.orderDate = orderDate;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Date getPickupDateTime() {
        return pickupDateTime;
    }

    public void setPickupDateTime(Date pickupDateTime) {
        this.pickupDateTime = pickupDateTime;
    }

    public Date getHandOverDateTime() {
        return handOverDateTime;
    }

    public void setHandOverDateTime(Date handOverDateTime) {
        this.handOverDateTime = handOverDateTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getUpateDate() {
        return upateDate;
    }

    public void setUpateDate(Date upateDate) {
        this.upateDate = upateDate;
    }

    @XmlTransient
    public List<Vehiclehandover> getVehiclehandoverList() {
        return vehiclehandoverList;
    }

    public void setVehiclehandoverList(List<Vehiclehandover> vehiclehandoverList) {
        this.vehiclehandoverList = vehiclehandoverList;
    }

    public Customer getCuid() {
        return cuid;
    }

    public void setCuid(Customer cuid) {
        this.cuid = cuid;
    }

    public Car getCaid() {
        return caid;
    }

    public void setCaid(Car caid) {
        this.caid = caid;
    }

    @XmlTransient
    public List<Payment> getPaymentList() {
        return paymentList;
    }

    public void setPaymentList(List<Payment> paymentList) {
        this.paymentList = paymentList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (oid != null ? oid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.oid == null && other.oid != null) || (this.oid != null && !this.oid.equals(other.oid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.inheritor.mycompany.quickcabsservice.model.Orders[ oid=" + oid + " ]";
    }
    
}

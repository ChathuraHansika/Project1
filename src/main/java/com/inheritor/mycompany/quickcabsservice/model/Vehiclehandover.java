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
@Table(name = "vehiclehandover")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Vehiclehandover.findAll", query = "SELECT v FROM Vehiclehandover v")
    , @NamedQuery(name = "Vehiclehandover.findByHoid", query = "SELECT v FROM Vehiclehandover v WHERE v.hoid = :hoid")
    , @NamedQuery(name = "Vehiclehandover.findByHandOverDateTime", query = "SELECT v FROM Vehiclehandover v WHERE v.handOverDateTime = :handOverDateTime")})
public class Vehiclehandover implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "HOID")
    private Integer hoid;
    @Column(name = "HandOverDateTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date handOverDateTime;
    @JoinColumn(name = "OID", referencedColumnName = "OID")
    @ManyToOne(optional = false)
    private Orders oid;

    public Vehiclehandover() {
    }

    public Vehiclehandover(Integer hoid) {
        this.hoid = hoid;
    }

    public Integer getHoid() {
        return hoid;
    }

    public void setHoid(Integer hoid) {
        this.hoid = hoid;
    }

    public Date getHandOverDateTime() {
        return handOverDateTime;
    }

    public void setHandOverDateTime(Date handOverDateTime) {
        this.handOverDateTime = handOverDateTime;
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
        hash += (hoid != null ? hoid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Vehiclehandover)) {
            return false;
        }
        Vehiclehandover other = (Vehiclehandover) object;
        if ((this.hoid == null && other.hoid != null) || (this.hoid != null && !this.hoid.equals(other.hoid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.inheritor.mycompany.quickcabsservice.model.Vehiclehandover[ hoid=" + hoid + " ]";
    }
    
}

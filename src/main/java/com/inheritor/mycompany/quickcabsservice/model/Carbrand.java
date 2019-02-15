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
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Chathura
 */
@Entity
@Table(name = "carbrand")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Carbrand.findAll", query = "SELECT c FROM Carbrand c")
    , @NamedQuery(name = "Carbrand.findByBrandId", query = "SELECT c FROM Carbrand c WHERE c.brandId = :brandId")
    , @NamedQuery(name = "Carbrand.findByBrand", query = "SELECT c FROM Carbrand c WHERE c.brand = :brand")
    , @NamedQuery(name = "Carbrand.findByUpdatedDateTime", query = "SELECT c FROM Carbrand c WHERE c.updatedDateTime = :updatedDateTime")})
public class Carbrand implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "BrandId")
    private Integer brandId;
    @Size(max = 100)
    @Column(name = "Brand")
    private String brand;
    @Column(name = "UpdatedDateTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDateTime;
    @OneToMany(mappedBy = "brandId")
    private List<Car> carList;
    @OneToMany(mappedBy = "brandId")
    private List<Carmodel> carmodelList;

    public Carbrand() {
    }

    public Carbrand(Integer brandId) {
        this.brandId = brandId;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Date getUpdatedDateTime() {
        return updatedDateTime;
    }

    public void setUpdatedDateTime(Date updatedDateTime) {
        this.updatedDateTime = updatedDateTime;
    }

    @XmlTransient
    public List<Car> getCarList() {
        return carList;
    }

    public void setCarList(List<Car> carList) {
        this.carList = carList;
    }

    @XmlTransient
    public List<Carmodel> getCarmodelList() {
        return carmodelList;
    }

    public void setCarmodelList(List<Carmodel> carmodelList) {
        this.carmodelList = carmodelList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (brandId != null ? brandId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Carbrand)) {
            return false;
        }
        Carbrand other = (Carbrand) object;
        if ((this.brandId == null && other.brandId != null) || (this.brandId != null && !this.brandId.equals(other.brandId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.inheritor.mycompany.quickcabsservice.model.Carbrand[ brandId=" + brandId + " ]";
    }
    
}

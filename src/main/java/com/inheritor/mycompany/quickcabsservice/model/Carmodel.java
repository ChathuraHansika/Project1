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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "carmodel")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Carmodel.findAll", query = "SELECT c FROM Carmodel c")
    , @NamedQuery(name = "Carmodel.findByModelId", query = "SELECT c FROM Carmodel c WHERE c.modelId = :modelId")
    , @NamedQuery(name = "Carmodel.findByModel", query = "SELECT c FROM Carmodel c WHERE c.model = :model")
    , @NamedQuery(name = "Carmodel.findByUpdatedDateTime", query = "SELECT c FROM Carmodel c WHERE c.updatedDateTime = :updatedDateTime")})
public class Carmodel implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ModelId")
    private Integer modelId;
    @Size(max = 100)
    @Column(name = "Model")
    private String model;
    @Column(name = "UpdatedDateTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDateTime;
    @OneToMany(mappedBy = "modelId")
    private List<Car> carList;
    @JoinColumn(name = "BrandId", referencedColumnName = "BrandId")
    @ManyToOne
    private Carbrand brandId;

    public Carmodel() {
    }

    public Carmodel(Integer modelId) {
        this.modelId = modelId;
    }

    public Integer getModelId() {
        return modelId;
    }

    public void setModelId(Integer modelId) {
        this.modelId = modelId;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
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

    public Carbrand getBrandId() {
        return brandId;
    }

    public void setBrandId(Carbrand brandId) {
        this.brandId = brandId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (modelId != null ? modelId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Carmodel)) {
            return false;
        }
        Carmodel other = (Carmodel) object;
        if ((this.modelId == null && other.modelId != null) || (this.modelId != null && !this.modelId.equals(other.modelId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.inheritor.mycompany.quickcabsservice.model.Carmodel[ modelId=" + modelId + " ]";
    }
    
}

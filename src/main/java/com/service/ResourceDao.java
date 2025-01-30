package com.service;

import com.entity.Resource2;
import com.entity.TVPSSResource;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@Repository
public class ResourceDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public List<TVPSSResource> getAllResources() {
		return getCurrentSession().createQuery("from TVPSSResource", TVPSSResource.class).getResultList();
	}

	@Transactional
	public TVPSSResource getResourceById(int id) {
		return getCurrentSession().get(TVPSSResource.class, id);
	}

	@Transactional
	public void saveResource(TVPSSResource resource) {
		getCurrentSession().saveOrUpdate(resource);
	}

	@Transactional
	public void updateResourceStatus(int id, String status) {
	    TVPSSResource resource = getResourceById(id);
	    if (resource != null) {
	        resource.setStatus(status);
	        getCurrentSession().update(resource);  // Explicitly call update
	        getCurrentSession().flush();  // Ensure the changes are written to the database
	    }
	}

	@Transactional
	public void deleteResource(int id) {
		TVPSSResource resource = getResourceById(id);
		if (resource != null) {
			getCurrentSession().delete(resource);
		}
	}
	
	// New Resource2 methods
    @Transactional
    public List<Resource2> getAllResources2() {
        return getCurrentSession().createQuery("from Resource2", Resource2.class).getResultList();
    }

    @Transactional
    public Resource2 getResource2ById(String schoolCode) {
        return getCurrentSession().get(Resource2.class, schoolCode);
    }

    @Transactional
    public void saveResource2(Resource2 resource) {
        getCurrentSession().saveOrUpdate(resource);
    }

    @Transactional
    public void updateResource2(Resource2 resource) {
        getCurrentSession().update(resource);
        getCurrentSession().flush();
    }

    @Transactional
    public void deleteResource2(String schoolCode) {
        Resource2 resource = getResource2ById(schoolCode);
        if (resource != null) {
            getCurrentSession().delete(resource);
        }
    }
    
    @Transactional
    public List<Resource2> searchResources(String search) {
        String query = "from Resource2 where schoolCode like :search or type like :search";
        return getCurrentSession()
                .createQuery(query, Resource2.class)
                .setParameter("search", "%" + search + "%")
                .getResultList();
    }


	// Helper method to convert LocalDateTime to Date
	public static Date convertToDate(LocalDateTime localDateTime) {
		if (localDateTime == null) {
			return null;
		}
		return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
	}
}

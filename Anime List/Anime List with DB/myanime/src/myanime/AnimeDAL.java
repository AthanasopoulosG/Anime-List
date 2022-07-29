package myanime;


import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;



public class AnimeDAL {
	boolean saved=false;
	boolean updateCompleted=false;
	
	public void saveAnime(Anime ani) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.save(ani);
			
			// commit transaction
			transaction.commit();
			saved=true;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public Anime getAnime(String name) {

		Transaction transaction = null;
		Anime ani = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			ani = session.get(Anime.class, name);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ani;
	}
	
	public List<Anime> getCompletedAnime() {
			
			Transaction transaction = null;
			List<Anime> listOfAnime = null;
			try (Session session = HibernateUtil.getSessionFactory().openSession()) {
				// start a transaction
				transaction = session.beginTransaction();
				@SuppressWarnings("rawtypes")
				Query q = session.createQuery("from Anime a where a.status=:n");
				q.setParameter("n", "Completed");
				session.flush();
				@SuppressWarnings("unchecked")
				List<Anime> resultList = q.getResultList();
				listOfAnime = resultList;
				// commit transaction
				transaction.commit();
				updateCompleted=true;
			} catch (Exception e) {
				if (transaction != null) {
					transaction.rollback();
				}
				e.printStackTrace();
			}
			
			return listOfAnime;
	}
	
	public List<Anime> getTOWatchAnime() {
		
		Transaction transaction = null;
		List<Anime> listOfAnime = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			@SuppressWarnings("rawtypes")
			Query q = session.createQuery("from Anime a where a.status=:n");
			q.setParameter("n", "To Watch");
			session.flush();
			@SuppressWarnings("unchecked")
			List<Anime> resultList = q.getResultList();
			listOfAnime = resultList;
			// commit transaction
			transaction.commit();
			updateCompleted=true;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		
		return listOfAnime;
	}
	
	public List<Anime> getOngoingAnime() {
		
		Transaction transaction = null;
		List<Anime> listOfAnime = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			@SuppressWarnings("rawtypes")
			Query q = session.createQuery("from Anime a where a.status=:n");
			q.setParameter("n", "ongoing");
			session.flush();
			@SuppressWarnings("unchecked")
			List<Anime> resultList = q.getResultList();
			listOfAnime = resultList;
			// commit transaction
			transaction.commit();
			updateCompleted=true;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		
		return listOfAnime;
	}
	

	public void delete(String name) {

		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// Delete anime object
			Anime anime = session.get(Anime.class, name);
			if (anime != null) {
				session.delete(anime);
			}

			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	
	public void updateAnime(Anime ani) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// update the  object
			session.update(ani);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public void updateSummary(String name,String text) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			@SuppressWarnings("rawtypes") 
			Query q= session.createQuery("update Anime a set a.summary=:t where a.name=:n ");
			q.setParameter("t", text);
			q.setParameter("n", name);
			q.executeUpdate();
			// commit transaction
			transaction.commit();
			updateCompleted=true;
		} catch (Exception e) {
			updateCompleted=false;
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public void updateNotes(String name,String text) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			@SuppressWarnings("rawtypes") 
			Query q= session.createQuery("update Anime a set a.notes=:m where a.name=:n ");
			q.setParameter("m", text);
			q.setParameter("n", name);
			q.executeUpdate();
			// commit transaction
			transaction.commit();
			updateCompleted=true;
		} catch (Exception e) {
			updateCompleted=false;
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Anime> getsearch(String name){
		Transaction transaction = null;
		List<Anime> listOfAnime = null;
		List<Anime> searched=new ArrayList<Anime>();
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			listOfAnime = session.createQuery("from Anime").getResultList();
			session.flush();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		
		for(Anime a:listOfAnime) {
			if(a.getName().contains(name)) {
				searched.add(a);
			}
		}
		
		return searched;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<Anime> getAllAnime() {

		Transaction transaction = null;
		List<Anime> listOfAnime = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			listOfAnime = session.createQuery("from Anime").getResultList();
			session.flush();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return listOfAnime;
	}
	
	public boolean returnsaved() {
		return saved;
	}
	
	public boolean getupdateSum() {
		return updateCompleted;
	}

}

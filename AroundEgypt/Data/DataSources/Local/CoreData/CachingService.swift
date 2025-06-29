//
//  CachingService.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import CoreData

class CachingService {
    func cacheExperienceResponses(_ experienceArray: [ExperienceResponse], isRecommended: Bool = false) {
        let context = CoreDataManager.shared.context

        for experience in experienceArray {
            let experienceEntity = ExperienceEntity(context: context)
            experienceEntity.id = experience.id
            experienceEntity.title = experience.title
            experienceEntity.imagePath = experience.imagePath
            experienceEntity.experienceDescription = experience.description
            experienceEntity.views = Int64(experience.views)
            experienceEntity.likes = Int64(experience.likes)
            experienceEntity.cityName = experience.city.name
            experienceEntity.isRecommended = isRecommended
        }

        do {
            try context.save()
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }

    func getCachedExperienceResponses(isRecommended: Bool = false) -> [ExperienceResponse]? {
        let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<ExperienceEntity> = ExperienceEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isRecommended == \(isRecommended)")

        do {
            let results = try context.fetch(fetchRequest)
            return results.map { entity in
                ExperienceResponse(
                    id: entity.id ?? "",
                    title: entity.title ?? "",
                    imagePath: entity.imagePath ?? "",
                    description: entity.experienceDescription ?? "",
                    views: Int(entity.views),
                    likes: Int(entity.likes),
                    city: City(name: entity.cityName ?? "")
                )
            }
        } catch {
            print("Error fetching from Core Data: \(error)")
            return nil
        }
    }

    func clearCache(isRecommended: Bool = false) {
        CoreDataManager.shared.persistentContainer.performBackgroundTask { context in
            let fetchRequest: NSFetchRequest<ExperienceEntity> = ExperienceEntity.fetchRequest()

            fetchRequest.predicate = NSPredicate(format: "isRecommended == \(isRecommended)")

            do {
                let recommendedExperiences = try context.fetch(fetchRequest)

                for experience in recommendedExperiences {
                    context.delete(experience)
                }

                try context.save()
                print("Experiences deleted successfully.")
            } catch {
                print("Error deleting experiences: \(error)")
            }

        }
    }

    func clearAllCache() {
        let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = ExperienceEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("Error clearing cache: \(error)")
        }
    }
}

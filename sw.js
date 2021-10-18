const latestCacheName = 'Unwind'

/* Start the service worker and cache all of the app's content */
self.addEventListener('install', function (e) {
    e.waitUntil(
        caches.open(latestCacheName).then(function (cache) {
            return cache.addAll([
                'assets/1.mp4',
                'assets/2.mp4',
                'assets/3.mp4',
                'assets/4.mp4',
                'assets/app.ico',
                'assets/application-icon-20.jpg',
                'assets/bg-01.jpg',
                'assets/lightcurves.jpg',
                'assets/logo.jpg',
                'assets/phone1.jpg',
                'assets/reg.png',
                'assets/try1.gif',
                'assets/unwind.ico',
                'assets/wrdlogo.jpg',
                'admin/addRoles.html',
                'admin/assignRoles.html',
                'admin/calendar.html',
                'admin/company.html',
                'admin/profile.html',
                'admin/rules.html',
                'css/appr.css',
                'css/bootstrap.min.css',
                'css/calendar.css',
                'css/landing.css',
                'css/lvpp.css',
                'css/main.css',
                'css/pr.css',
                'css/reg.css',
                'css/sb.css',
                'employee/applyLeave.html',
                'employee/approveLeave.html',
                'employee/calendar.html',
                'employee/company.html',
                'employee/employeeProfile.html',
                'Login.html',
                'Register.html',
                'sw.js',
            ])
        })
    )
})

/* Serve cached content when offline */
self.addEventListener('fetch', function (e) {
    e.respondWith(
        caches.match(e.request).then(function (response) {
            return response || fetch(e.request)
        })
    )
})

self.addEventListener('activate', function (event) {
    event.waitUntil(
        caches.keys().then(function (cacheNames) {
            return Promise.all(
                cacheNames.map(function (cacheName) {
                    if (cacheName !== latestCacheName) {
                        // If this cache name isn't the same
                        // as current version of cache, then delete it.
                        return caches.delete(cacheName)
                    }

                })
            )
        })
    )
})

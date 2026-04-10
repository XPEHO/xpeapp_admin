/* eslint-disable no-undef */
importScripts('https://www.gstatic.com/firebasejs/10.12.2/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.12.2/firebase-messaging-compat.js');

async function initializeMessagingFromAssetsConfig() {
  try {
    const response = await fetch('/assets/assets/config.json', {
      cache: 'no-store',
    });

    if (!response.ok) {
      return;
    }

    const appConfig = await response.json();
    const firebaseWebConfig = appConfig.firebaseWebConfig;

    if (!firebaseWebConfig || !firebaseWebConfig.apiKey) {
      return;
    }

    firebase.initializeApp(firebaseWebConfig);

    const messaging = firebase.messaging();

    messaging.onBackgroundMessage((payload) => {
      const notificationTitle = payload.notification?.title || 'Nouvelle idee';
      const notificationOptions = {
        body: payload.notification?.body || 'Une nouvelle idee a ete soumise',
        data: payload.data || {},
      };

      self.registration.showNotification(notificationTitle, notificationOptions);
    });
  } catch (_) {
    // Ignore invalid/missing config.
  }
}

initializeMessagingFromAssetsConfig();

self.addEventListener('notificationclick', (event) => {
  event.notification.close();

  const targetUrl = event.notification?.data?.route || '/ideabox';

  event.waitUntil(
    clients
      .matchAll({ type: 'window', includeUncontrolled: true })
      .then((clientList) => {
        for (const client of clientList) {
          if ('focus' in client) {
            client.postMessage({ type: 'notification-click', route: targetUrl });
            return client.focus();
          }
        }
        if (clients.openWindow) {
          return clients.openWindow(targetUrl);
        }
        return undefined;
      })
  );
});

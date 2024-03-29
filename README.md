# contacty

A simple flutter contact app

### Info
lib folder structure:
<details >

```
lib/
├── contacty.dart
├── dependency_injection.dart
├── main.dart
├── router.dart
└── src/
    ├── core/
    │   ├── core.dart        
    │   └── extensions.dart  
    ├── presentation/
    │   ├── pages/
    │   │   ├── contacts/
    │   │   │   ├── bloc/
    │   │   │   │   ├── contacts_bloc.dart
    │   │   │   │   ├── contacts_event.dart
    │   │   │   │   └── contacts_state.dart
    │   │   │   ├── contacts.dart
    │   │   │   ├── contacts_page.dart
    │   │   │   └── widgets/
    │   │   │       ├── contact_item.dart
    │   │   │       └── widgets.dart
    │   │   ├── home/
    │   │   │   ├── home.dart
    │   │   │   └── home_page.dart
    │   │   ├── info/
    │   │   │   ├── bloc/
    │   │   │   │   ├── info_bloc.dart
    │   │   │   │   ├── info_event.dart
    │   │   │   │   └── info_state.dart
    │   │   │   ├── info.dart
    │   │   │   ├── info_page.dart
    │   │   │   └── widgets/
    │   │   │       ├── contact_info_item.dart
    │   │   │       └── widgets.dart
    │   │   ├── pages.dart
    │   │   └── recents/
    │   │       ├── bloc/
    │   │       │   ├── recents_bloc.dart
    │   │       │   ├── recents_event.dart
    │   │       │   └── recents_state.dart
    │   │       ├── recents.dart
    │   │       ├── recents_page.dart
    │   │       └── widgets/
    │   │           ├── call_item.dart
    │   │           └── widgets.dart
    │   ├── presentation.dart
    │   └── widgets/
    │       ├── base_note_widget.dart
    │       ├── contact_avatar.dart
    │       ├── error_content_widget.dart
    │       ├── header.dart
    │       ├── loading_widget.dart
    │       ├── no_permission_widget.dart
    │       ├── note_text_widget.dart
    │       └── widgets.dart
    ├── services/
    │   ├── contacts/
    │   │   ├── call_log_handler.dart
    │   │   ├── contacts.dart
    │   │   ├── contacts_info.dart
    │   │   ├── contacts_service.dart
    │   │   └── models/
    │   │       ├── call_log_model.dart
    │   │       ├── call_type.dart
    │   │       ├── contact_info_model.dart
    │   │       └── models.dart
    │   ├── permissions/
    │   │   ├── permissions.dart
    │   │   └── permissions_service.dart
    │   └── services.dart
    └── src.dart

```

</details>
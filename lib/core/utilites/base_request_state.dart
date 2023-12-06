abstract class BaseRequestState{}
class BaseRequestInitState extends BaseRequestState{}
class BaseRequestLoadingState extends BaseRequestState{}
class BaseRequestSuccessState extends BaseRequestState{}
class BaseRequestErrorState extends BaseRequestState{
  late String errorMessage;
  BaseRequestErrorState(this.errorMessage);
}
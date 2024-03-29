#if 0
#elif defined(__arm64__) && __arm64__
// Generated by Apple Swift version 5.7.2 (swiftlang-5.7.2.135.5 clang-1400.0.29.51)
#ifndef VNWEBSDK_SWIFT_H
#define VNWEBSDK_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wduplicate-method-match"
#pragma clang diagnostic ignored "-Wauto-import"
#if defined(__OBJC__)
#include <Foundation/Foundation.h>
#endif
#if defined(__cplusplus)
#include <cstdint>
#include <cstddef>
#include <cstdbool>
#else
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#endif

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if defined(__OBJC__)
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#endif
#if !defined(SWIFT_EXTERN)
# if defined(__cplusplus)
#  define SWIFT_EXTERN extern "C"
# else
#  define SWIFT_EXTERN extern
# endif
#endif
#if !defined(SWIFT_CALL)
# define SWIFT_CALL __attribute__((swiftcall))
#endif
#if defined(__cplusplus)
#if !defined(SWIFT_NOEXCEPT)
# define SWIFT_NOEXCEPT noexcept
#endif
#else
#if !defined(SWIFT_NOEXCEPT)
# define SWIFT_NOEXCEPT 
#endif
#endif
#if defined(__cplusplus)
#if !defined(SWIFT_CXX_INT_DEFINED)
#define SWIFT_CXX_INT_DEFINED
namespace swift {
using Int = ptrdiff_t;
using UInt = size_t;
}
#endif
#endif
#if defined(__OBJC__)
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreLocation;
@import Foundation;
@import ObjectiveC;
@import UIKit;
@import WebKit;
#endif

#endif
#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="VNWebSDK",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

#if defined(__OBJC__)
typedef SWIFT_ENUM(NSInteger, AnalyticsEvent, open) {
  AnalyticsEventTrackUser = 0,
  AnalyticsEventTrackUserAffiliations = 1,
  AnalyticsEventTrackRvcSelection = 2,
  AnalyticsEventTrackMenuItemSelection = 3,
  AnalyticsEventTrackBeginCheckout = 4,
  AnalyticsEventTrackAddItemToCart = 5,
  AnalyticsEventTrackRemoveItemFromCart = 6,
  AnalyticsEventTrackCompletedPurchase = 7,
  AnalyticsEventTrackCheckoutProgress = 8,
};



@class NSString;

@interface NSObject (SWIFT_EXTENSION(VNWebSDK))
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull classStringName;)
+ (NSString * _Nonnull)classStringName SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull domain;)
+ (NSString * _Nonnull)domain SWIFT_WARN_UNUSED_RESULT;
@end

typedef SWIFT_ENUM(NSInteger, PaymentMethodInstrument, open) {
  PaymentMethodInstrumentCreditCard = 0,
  PaymentMethodInstrumentApplePay = 1,
};

@class UIViewController;
@protocol PaymentRepresentable;
@class NSError;

SWIFT_PROTOCOL("_TtP8VNWebSDK18PaymentProcessable_")
@protocol PaymentProcessable
- (void)processPaymentFrom:(UIViewController * _Nullable)viewController transactionData:(NSDictionary<NSString *, id> * _Nonnull)transactionData completion:(void (^ _Nonnull)(id <PaymentRepresentable> _Nullable, NSError * _Nullable))completion;
- (void)completedPaymentWithOrderId:(NSString * _Nonnull)orderId quantity:(NSInteger)quantity discount:(NSInteger)discount tips:(NSInteger)tips tax:(NSInteger)tax total:(NSInteger)total paymentTypes:(NSString * _Nullable)paymentTypes;
@end


SWIFT_PROTOCOL("_TtP8VNWebSDK20PaymentRepresentable_")
@protocol PaymentRepresentable
@property (nonatomic, copy) NSString * _Nonnull nonce;
@property (nonatomic, copy) NSString * _Nonnull cardType;
@property (nonatomic, copy) NSString * _Nonnull lastFour;
@property (nonatomic, copy) NSString * _Nullable cardHolderName;
@property (nonatomic) enum PaymentMethodInstrument instrument;
@end

typedef SWIFT_ENUM(NSInteger, ProductType, open) {
  ProductTypeFood = 0,
  ProductTypeMerchandise = 1,
  ProductTypeExperience = 2,
  ProductTypeAll = 3,
  ProductTypeNone = 4,
};


SWIFT_CLASS("_TtC8VNWebSDK14SectionRowSeat")
@interface SectionRowSeat : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

typedef SWIFT_ENUM(NSInteger, ServiceType, open) {
  ServiceTypeDelivery = 0,
  ServiceTypePickup = 1,
  ServiceTypeNone = 2,
};




@interface UINavigationController (SWIFT_EXTENSION(VNWebSDK))
- (void)pushRVCS;
- (void)pushRVCSWithNoWaitTimes:(BOOL)noWaitTimes serviceType:(enum ServiceType)serviceType locations:(NSArray<NSString *> * _Nonnull)locations categories:(NSArray<NSString *> * _Nonnull)categories;
- (void)pushFnB;
- (void)pushFnBWithServiceType:(enum ServiceType)serviceType;
- (void)pushFnBWithNoWaitTimes:(BOOL)noWaitTimes serviceType:(enum ServiceType)serviceType locations:(NSArray<NSString *> * _Nonnull)locations categories:(NSArray<NSString *> * _Nonnull)categories;
- (void)pushMerchandise;
- (void)pushMerchandiseWithServiceType:(enum ServiceType)serviceType;
- (void)pushMerchandiseWithNoWaitTimes:(BOOL)noWaitTimes serviceType:(enum ServiceType)serviceType locations:(NSArray<NSString *> * _Nonnull)locations categories:(NSArray<NSString *> * _Nonnull)categories;
- (void)pushExperiences;
- (void)pushFnBMenuWithMenu:(NSString * _Nullable)menu;
- (void)pushMerchandiseMenuWithMenu:(NSString * _Nullable)menu;
- (void)pushExperienceMenuWithMenu:(NSString * _Nullable)menu event:(NSString * _Nullable)event;
- (void)pushFoodMenuItemWithMenu:(NSString * _Nullable)menu item:(NSString * _Nullable)item;
- (void)pushMerchandiseMenuItemWithMenu:(NSString * _Nullable)menu item:(NSString * _Nullable)item;
- (void)pushExperienceDetailsWithMenu:(NSString * _Nullable)menu item:(NSString * _Nullable)item event:(NSString * _Nullable)event variant:(NSString * _Nullable)variant;
- (void)pushWallet;
- (void)pushVirtualCurrencyActivity;
- (void)pushOrderHistory;
- (void)pushOrderReceiptWithReceipt:(NSString * _Nonnull)receipt;
- (void)pushSendVirtualCurrency;
- (void)pushScanAndPay;
- (void)pushScanner;
- (void)pushQrCode;
- (void)pushBenefitsAndRewards;
- (void)pushMyInfo;
- (void)pushPayments;
- (void)pushLoadTicket;
- (void)pushBadge;
@end




SWIFT_CLASS("_TtC8VNWebSDK4User")
@interface User : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_PROTOCOL("_TtP8VNWebSDK19VNAnalyticsProtocol_")
@protocol VNAnalyticsProtocol
/// Track when User ID is populated
/// \param id UUID of user
///
- (void)trackUserId:(NSString * _Nonnull)id email:(NSString * _Nullable)email name:(NSString * _Nullable)name;
/// Track when a User’s affiliations (member tiers) are populated.
/// Currently reported when user views wallet or attempts to make a purchase
/// that is gated by a(n) affiliation(s)
/// \param affiliations Array of affiliations the User belongs to
///
- (void)trackUserAffiliations:(NSArray<NSString *> * _Nonnull)affiliations;
/// Track when user selects an RVC to view
/// \param itemId UUID of item
///
/// \param itemName Name of item
///
/// \param itemCategory Category of item
///
- (void)trackRvcSelectionWithItemId:(NSString * _Nonnull)itemId itemName:(NSString * _Nonnull)itemName itemCategory:(NSString * _Nonnull)itemCategory;
/// Track when user selects an item from a Menu.
/// \param itemId UUID of item
///
/// \param itemName Name of item
///
/// \param itemCategory Category of item
///
/// \param variant SKU of item variant
///
/// \param price Price of item in cents
///
- (void)trackMenuItemSelectionWithItemId:(NSString * _Nonnull)itemId itemName:(NSString * _Nonnull)itemName itemCategory:(NSString * _Nonnull)itemCategory variant:(NSString * _Nonnull)variant price:(NSInteger)price;
/// Tracks Cart view event, caled when component mounts.
- (void)trackBeginCheckout;
/// Tracks adding items to the cart.
/// \param itemId UUID of item
///
/// \param itemName Name of item
///
/// \param itemCategory Category of item
///
/// \param variant SKU of item variant
///
/// \param price Price of item in cents
///
/// \param quantity Quantity of item added to cart
///
- (void)trackAddItemToCartWithItemId:(NSString * _Nonnull)itemId itemName:(NSString * _Nonnull)itemName itemCategory:(NSString * _Nonnull)itemCategory variant:(NSString * _Nonnull)variant price:(NSInteger)price quantity:(NSInteger)quantity;
/// Tracks removing items from the cart.
/// \param itemId UUID of item
///
/// \param itemName Name of item
///
/// \param itemCategory Category of item
///
/// \param variant SKU of item variant
///
/// \param price Price of item in cents
///
/// \param quantity Quantity of item removed from the cart
///
- (void)trackRemoveItemFromCartWithItemId:(NSString * _Nonnull)itemId itemName:(NSString * _Nonnull)itemName itemCategory:(NSString * _Nonnull)itemCategory variant:(NSString * _Nonnull)variant price:(NSInteger)price quantity:(NSInteger)quantity;
/// Tracks when a user completes a purchase.
/// \param orderId UUID of order
///
/// \param quantity Number of items purchased
///
/// \param discount Discount amount in dollars
///
/// \param tips Tip amount in dollars
///
/// \param tax Tax amount in dollars
///
/// \param total Total amount in dollars
///
/// \param paymentTypes Payment type utilized
///
/// \param name User first and last name
///
/// \param email User email address
///
- (void)trackCompletedPurchaseWithOrderId:(NSString * _Nonnull)orderId quantity:(NSInteger)quantity discount:(NSInteger)discount tips:(NSInteger)tips tax:(NSInteger)tax total:(NSInteger)total paymentTypes:(NSString * _Nullable)paymentTypes name:(NSString * _Nullable)name email:(NSString * _Nullable)email;
/// Tracks the progress of an order after checking out.
/// \param orderId UUID of order
///
/// \param state State of order
///
- (void)trackCheckoutProgressWithOrderId:(NSString * _Nonnull)orderId state:(NSString * _Nonnull)state;
@end

@class UIColor;

SWIFT_PROTOCOL("_TtP8VNWebSDK10VNThemable_")
@protocol VNThemable
@property (nonatomic, readonly, strong) UIColor * _Nonnull navigationBarBackground;
@property (nonatomic, readonly, strong) UIColor * _Nonnull accent;
@property (nonatomic, readonly, copy) NSString * _Nonnull backString;
@property (nonatomic, readonly, copy) NSString * _Nonnull closeString;
@end


SWIFT_CLASS("_TtC8VNWebSDK11VNBaseTheme")
@interface VNBaseTheme : NSObject <VNThemable>
@property (nonatomic, strong) UIColor * _Nonnull navigationBarBackground;
@property (nonatomic, strong) UIColor * _Nonnull accent;
@property (nonatomic, copy) NSString * _Nonnull backString;
@property (nonatomic, copy) NSString * _Nonnull closeString;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8VNWebSDK12VNNavigation")
@interface VNNavigation : NSObject
+ (UINavigationController * _Nullable)foodAndBeverage SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)foodAndBeverageWithServiceType:(enum ServiceType)serviceType SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)merchandise SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)merchandiseWithServiceType:(enum ServiceType)serviceType SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)experiences SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)foodAndBeverageMenuWithMenu:(NSString * _Nullable)menu SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)merchandiseMenuWithMenu:(NSString * _Nullable)menu SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)experienceMenuWithMenu:(NSString * _Nullable)menu event:(NSString * _Nullable)event SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)experienceDetailsWithMenu:(NSString * _Nullable)menu item:(NSString * _Nullable)item event:(NSString * _Nullable)event variant:(NSString * _Nullable)variant SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)wallet SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)virtualCurrentyActivity SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)orderHistory SWIFT_WARN_UNUSED_RESULT;
+ (UINavigationController * _Nullable)orderReceiptWithReceipt:(NSString * _Nonnull)receipt SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

enum VNWebPageType : NSInteger;

SWIFT_PROTOCOL("_TtP8VNWebSDK20VNNavigationProtocol_")
@protocol VNNavigationProtocol
- (void)webViewDismissed;
- (void)webViewWillDismiss:(enum VNWebPageType)pageType;
- (void)webViewDidDismiss:(enum VNWebPageType)pageType;
@end


SWIFT_CLASS("_TtC8VNWebSDK18VNPaymentProcessor")
@interface VNPaymentProcessor : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, strong) id <PaymentProcessable> _Nullable shared;)
+ (id <PaymentProcessable> _Nullable)shared SWIFT_WARN_UNUSED_RESULT;
+ (void)setShared:(id <PaymentProcessable> _Nullable)value;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


typedef SWIFT_ENUM(NSInteger, VNWebPageType, open) {
  VNWebPageTypeVendors = 0,
  VNWebPageTypeMenu = 1,
  VNWebPageTypeReceipt = 2,
  VNWebPageTypeWallet = 3,
  VNWebPageTypeWalletVcActivity = 4,
  VNWebPageTypeWalletVcTransfer = 5,
  VNWebPageTypeWalletAwardsRules = 6,
  VNWebPageTypeWalletSettings = 7,
  VNWebPageTypeWalletPayments = 8,
  VNWebPageTypeWalletBadge = 9,
  VNWebPageTypeWalletScanAndPay = 10,
  VNWebPageTypeWalletScanner = 11,
  VNWebPageTypeWalletQrCode = 12,
  VNWebPageTypeUnknown = 13,
};

@class WebViewController;

SWIFT_CLASS("_TtC8VNWebSDK16VNWebViewFactory")
@interface VNWebViewFactory : NSObject
+ (WebViewController * _Nullable)foodAndBeverage SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)foodAndBeverageWithServiceType:(enum ServiceType)serviceType SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)merchandise SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)merchandiseWithServiceType:(enum ServiceType)serviceType SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)experiences SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)foodAndBeverageMenuWithMenu:(NSString * _Nullable)menu SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)merchandiseMenuWithMenu:(NSString * _Nullable)menu SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)experienceMenuWithMenu:(NSString * _Nullable)menu event:(NSString * _Nullable)event SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)experienceDetailsWithMenu:(NSString * _Nullable)menu item:(NSString * _Nullable)item event:(NSString * _Nullable)event variant:(NSString * _Nullable)variant SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)wallet SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)virtualCurrentyActivity SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)orderHistory SWIFT_WARN_UNUSED_RESULT;
+ (WebViewController * _Nullable)orderReceiptWithReceipt:(NSString * _Nonnull)receipt SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8VNWebSDK12VenueNextWeb")
@interface VenueNextWeb : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) VenueNextWeb * _Nonnull shared;)
+ (VenueNextWeb * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
/// Initialize the SDK with your OrderNext assigned Organization name
/// \param org OrderNext Organization Name
///
/// \param instance OrderNext instance name ie (https://<instance>.ordernext.com
///
- (void)initialize:(NSString * _Nonnull)org instance:(NSString * _Nonnull)instance;
/// Initialize the SDK with your OrderNext assigned Organization name and Environment
/// \param org OrderNext Organization Name
///
/// \param instance OrderNext instance name ie (https://<instance>.ordernext.com
///
/// \param env Environment name (dev, qa, prd)
///
- (void)initialize:(NSString * _Nonnull)org instance:(NSString * _Nonnull)instance env:(NSString * _Nonnull)env;
/// Configure the Braintree based native payment procesor for credit card processing. Gated by OrderNext configuration
/// value for payments provider.
/// \param processor Object that adheres to PaymentProcessable
///
/// \param completion If set successfully, completion execute with nil NSError.
///
- (void)configureBrainTree:(id <PaymentProcessable> _Nonnull)processor completion:(void (^ _Nonnull)(NSError * _Nullable))completion;
/// Configure the Braintree based external payment procesor for credit card processing. Gated by OrderNext configuration
/// value for payments provider.
/// \param processor Object that adheres to PaymentProcessable
///
/// \param completion If set successfully, completion execute with nil NSError.
///
- (void)configureExternalPaymentProcessor:(id <PaymentProcessable> _Nonnull)processor completion:(void (^ _Nonnull)(NSError * _Nullable))completion;
/// Initialize the SDK with your OrderNext assigned domain
/// (Primarily used for development purposes)
/// \param domain Fully qualified domain name of OrderNext instance
///
/// \param org OrderNext Organization Name
///
/// \param instance OrderNext instance name ie (https://<instance>.ordernext.com
///
/// \param env Environment name (dev, prd, qa)
///
- (void)initializeWithDomain:(NSString * _Nonnull)domain org:(NSString * _Nonnull)org instance:(NSString * _Nonnull)instance env:(NSString * _Nonnull)env;
- (void)setUser:(User * _Nonnull)user;
- (void)logUserOut;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSURL;

@interface VenueNextWeb (SWIFT_EXTENSION(VNWebSDK))
+ (BOOL)canHandleWithUrl:(NSURL * _Nonnull)url SWIFT_WARN_UNUSED_RESULT;
+ (void)handleWithUrl:(NSURL * _Nonnull)url presenter:(UIViewController * _Nonnull)presenter completion:(void (^ _Nullable)(BOOL))completion;
@end


@interface VenueNextWeb (SWIFT_EXTENSION(VNWebSDK))
- (BOOL)canHandleWithUrl:(NSURL * _Nonnull)url SWIFT_WARN_UNUSED_RESULT;
- (void)handleWithUrl:(NSURL * _Nonnull)url presenter:(UIViewController * _Nonnull)presenter completion:(void (^ _Nullable)(BOOL))completion;
@end

typedef SWIFT_ENUM(NSInteger, WalletMode, open) {
  WalletModeBoth = 0,
  WalletModeQrCodeOnly = 1,
  WalletModeQrScannerOnly = 2,
};

@class NSCoder;
@class WKWebView;
@class WKNavigation;
@class NSURLAuthenticationChallenge;
@class NSURLCredential;
@class WKWebViewConfiguration;
@class WKNavigationAction;
@class WKWindowFeatures;
@class NSBundle;

SWIFT_CLASS("_TtC8VNWebSDK17WebViewController")
@interface WebViewController : UIViewController <WKNavigationDelegate, WKUIDelegate>
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder SWIFT_UNAVAILABLE;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)observeValueForKeyPath:(NSString * _Nullable)keyPath ofObject:(id _Nullable)object change:(NSDictionary<NSKeyValueChangeKey, id> * _Nullable)change context:(void * _Nullable)context;
- (void)webView:(WKWebView * _Nonnull)webView didFinishNavigation:(WKNavigation * _Null_unspecified)navigation;
- (void)webView:(WKWebView * _Nonnull)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge * _Nonnull)challenge completionHandler:(void (^ _Nonnull)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler;
- (WKWebView * _Nullable)webView:(WKWebView * _Nonnull)webView createWebViewWithConfiguration:(WKWebViewConfiguration * _Nonnull)configuration forNavigationAction:(WKNavigationAction * _Nonnull)navigationAction windowFeatures:(WKWindowFeatures * _Nonnull)windowFeatures SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil SWIFT_UNAVAILABLE;
@end

@class WKUserContentController;
@class WKScriptMessage;
@class CLLocationManager;
@class CLLocation;

@interface WebViewController (SWIFT_EXTENSION(VNWebSDK)) <CLLocationManagerDelegate, WKScriptMessageHandler>
- (void)userContentController:(WKUserContentController * _Nonnull)userContentController didReceiveScriptMessage:(WKScriptMessage * _Nonnull)message;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateLocations:(NSArray<CLLocation *> * _Nonnull)locations;
@end

#endif
#if defined(__cplusplus)
#endif
#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif

#else
#error unsupported Swift architecture
#endif
